using JAG.DeveloperTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JAG.DeveloperTest.Views
{
    public class QuestionController : Controller
    {

        private JAGDevTestEntities _database;

        public QuestionController()
        {
            _database = new JAGDevTestEntities();
        }

        public ActionResult Index()
        {
            return View();
        }

        #region Question 03 - Arrays
        public ActionResult Question03()
        {
            // Method to push value to an array and return the updated array
            var PushValue = new Func<string[], string, string[]>((ArrayObj, value) => {
                Array.Resize(ref ArrayObj, ArrayObj.Length + 1);
                ArrayObj[ArrayObj.GetUpperBound(0)] = value;
                return ArrayObj;
            });

            // Method to compare two arrays and return the intersection elements of both arrays
            var CompareArrays = new Func<int[], dynamic[], string[]>((FirstArray, SecondArray) => {

                string[] Intersection = new string[0];

                for (int array1index = 0; array1index < FirstArray.Length; array1index++)
                {
                    for (int array2index = 0; array2index < SecondArray.Length; array2index++)
                    {
                        if (SecondArray[array2index] == FirstArray[array1index])
                        {
                            Intersection = PushValue(Intersection, SecondArray[array2index].ToString());
                        }
                    }
                }
                return Intersection;
            });

            // Method to complete question 3 - using a traditional approach of a nested for loop
            var Question03Part1 = new Action(() =>
            {
                int[] Arr1 = { 1, 2, 3, 4, 5, 100, 42, 50 };
                dynamic Arr2 = new dynamic[] { 3, 2, 9, 3, 7, 42, 42, 'a' };
                string[] Common = CompareArrays(Arr1, Arr2);
                string part1Answer = string.Join(",", Common.Distinct<string>());
                ViewBag.CommonElements1 = part1Answer;

            });

            // Method to complete question 3 using Linq methods
            var Question03Part2 = new Action(() =>
            {
                int[] Arr1 = { 1, 2, 3, 4, 5, 100, 42, 50 };
                var Arr2 = new[] { 3, 2, 9, 3, 7, 42, 42, 'a' };
                var CommonElements = Arr1.Intersect(Arr2);
                string part2Answer = string.Join(",", CommonElements.Select(element => element.ToString()).ToArray());
                ViewBag.CommonElements2 = part2Answer;

            });
            Question03Part1();
            Question03Part2();
            return View();
        }
        #endregion Question 03 - Arrays

        #region Question 04 - FizzBuzz
        public ActionResult Question04()
        {
            string[] NumberList = new string[100];
            for (int incrementer = 1; incrementer <= 100; incrementer++)
            {
                if ((incrementer % 3 == 0) && (incrementer % 5 == 0))
                {
                    NumberList[incrementer - 1] = "FizzBuzz";
                }
                else if (incrementer % 3 == 0)
                {
                    NumberList[incrementer - 1] = "Fizz";
                }
                else if (incrementer % 5 == 0)
                {
                    NumberList[incrementer - 1] = "Buzz";
                }
                else
                {
                    NumberList[incrementer - 1] = incrementer.ToString();
                }
            }
            ViewBag.NumberList = NumberList;
            return View();
        }
        #endregion Question 04 - FizzBuzz

        #region Question 05 - DB reading
        public ActionResult Question05()
        {
            /*var query1 = context.Leads.Include(l => l.LeadDistributions).FirstOrDefault(m => m.LeadId == 3);*/
            /*JAGDevTestEntities DataBase = new JAGDevTestEntities();*/
            /*List<Lead> Leads = _database.Leads.ToList();*/
            var query = _database.Leads.SelectMany(lead => lead.LeadDistributions);
            List<Lead> leads = _database.Leads.ToList();
            List<Client> clients = _database.Clients.ToList();
            List<LeadDistribution> leadsDist = _database.LeadDistributions.ToList();
            ViewBag.leads = leads;
            ViewBag.clients = clients;
            ViewBag.leadDists = leadsDist;
            /*var data = new { leads, clients, leadsDist };
            ViewBag.data = data;*/
            return View();
        }
        #endregion Question 05 - DB reading

        #region Question 06 - DB writing & validation
        public ActionResult Question06()
        {
            return View();
        }
        #endregion Question 06 - DB writing & validation

        public ActionResult Question07()
        {
            return View();
        }

        public ActionResult Question08()
        {
            return View();
        }

        public ActionResult Question08LongRunningTask()
        {
            //TODO: when testing decrease this number to something reasonable to the task will actually complete.
            long numberOfDecimalPlaces = long.MaxValue;

            //Call the long running process
            decimal pi = QuestionHelper.ParallelPartitionerPi(numberOfDecimalPlaces);
            
            //TODO: return the results to the view
            return View("Question09");
        }
	}
}