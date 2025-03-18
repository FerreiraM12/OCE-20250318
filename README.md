# CV-APEX-INTERVIEW

- Create account in https://apex.oracle.com/en/
- Request Workspace
- Data Model
    - Quick SQL script

```sql
jobs /insert 4
  name /upper /unique /check developer, analyst, manager, assistant
departments /insert 5
  name vc100 /nn /upper /unique /check hr, development, legal, sales, operations
  cost center num
  employees /insert 100
    first_name vc100
    last_name vc100
    email /lower vc100
    hire_date vc6 /values 100123
    city vc100
    country vc100
    job id /references jobs
```

> [!INFO]
> Please avoid data model changes, but if needed please include them in a install.sql file placed next to the application export file
> After finishing the problems, create a public repository in Github, push your code and send us the Github Public URL
> If for some reason this is not possible, send us a zip folder containing both `first-problem/webapp` and `second-problem/webapp` folders.


## First Problem
 1. Load SQL file placed inside `first-problem/webapp` to your workspace
 2. This applications consists of a page that has an error when adding a new Employee to the employees table
     - To replicate the issue:
     - Navigate to 'Employees' page 4
     - Press 'Create' from the grid menu bar
     - Fill in the new employee details and press enter
 3. Please identify the bug and fix it
 4. After resolved, export the application as a single file and replace the original file in the first-problem/webapp folder

## Second Problem
Development Assumptions:
 - All data manipulation to be done on top of APEX Collections
 - Up to the candidate to decide if save is done in each Interactive Grid or at page level
     - Expect to be asked why you made either decision
 Development guidelines:
 - Create application with title 'Manage Employees':
    - Create page manage employee
         - Create region with title 'Dashboards' that includes:
             - 1 badge with total number of employees
             - 1 bar chart with number of employees per department
         - Create region named 'Assign employee', which is expected to contain:
             - 2 interactive grids defined as master / detail
                 - The master interactive grid will have the following functionality:
                     - Data based on department table
                     - Fields:
                         - Name
                         - Cost Center
                     - Remove button in the interactive grid toolbar
                        - Button only available for click once a department record is selected, and only one at a time
                     - Implement remove department with an AJAX callback from master
                         - Remove a department will remove the references to those departments from the employees assigned to it
                 - The detail interactive grid will have the following functionality:
                     - Data based on employees
                     - Fields:
                         - Department name
                         - First Name
                         - Last Name
                         - Email
                         - Hire Date
                         - City
                         - Country
                         - Job
                     - Add/Remove buttons in the interactive grid toolbar
                     - Add button will open a popup dialog to search for an employee and will have a OK button at the bottom right corner and close at the left bottom corner:
                         - OK persists the employee to the collection
                         - Close, closes the dialog
                         - Form fields:
                             - First Name
                             - Last Name
                             - Email
                             - Hire Date (Date picker)
                             - City
                             - Country
                             - Job (LOV)
                     - Remove button will remove users with an AJAX callback
 - After you finish, export the application as a single file and place in the folder `second-problem/webapp`


