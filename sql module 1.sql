/*1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.*/

drop database sql_assignment;
Create database sql_assignment;
use sql_assignment;
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY NOT NULL,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL DEFAULT 30000
);


/*2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.

Ans- 

Purpose of Constraints in a Database
Constraints are rules enforced on columns in a database table to ensure data integrity, consistency, and accuracy. They prevent invalid data entry and help maintain reliable relationships between data.

How Constraints Help Maintain Data Integrity-
Preventing Invalid Data Entry: Constraints ensure only valid data is inserted (e.g., a CHECK constraint ensures an age is at least 18).
Ensuring Uniqueness: Unique constraints prevent duplicate values in specific columns (e.g., email should be unique for each employee).
Enforcing Relationships: Foreign key constraints maintain referential integrity between related tables.
Providing Default Values: Default constraints ensure a column has a value even if none is provided (e.g., setting a default salary of 30,000). */


/*3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.

Ans- 

The NOT NULL constraint is applied to a column when we want to ensure that it always contains a value. In a database, missing or NULL values can lead to incomplete records, which may cause errors in data processing and analysis. By enforcing NOT NULL, we prevent users from leaving critical fields empty, ensuring data completeness and accuracy.

For example, in an employees table, the emp_name field should never be NULL because every employee must have a name. If we allow NULL values, there might be records with missing names, making it difficult to identify employees. Similarly, fields like date_of_birth or email should also be NOT NULL to ensure that all necessary information is available when needed.

No, a primary key cannot contain NULL values.

Justification:
Uniqueness Requirement: A primary key uniquely identifies each row. If it contains NULL, multiple rows could have NULL values, violating uniqueness.
Indexing Behavior: Most databases use an index for primary keys, and NULL values do not work well in indexed columns meant for unique identification.
Entity Integrity Rule: A primary key must always have a valid value to maintain entity integrity.*/

/*4.Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint. 
Ans- 
Adding or Removing Constraints on an Existing Table
In SQL, constraints are essential for maintaining data integrity by enforcing rules on table columns. However, as business needs evolve, we may need to modify these constraints to allow more flexibility or enforce stricter rules. The ALTER TABLE statement enables us to add or remove constraints without deleting and recreating the table.
When adding a constraint, we use the ALTER TABLE statement along with ADD CONSTRAINT. Before applying a new constraint, it is important to ensure that existing data follows the rule; otherwise, the operation may fail. For instance, if we want to ensure that no two employees have the same email address, we can add a UNIQUE constraint on the email column using the following command:
*/

ALTER TABLE employees  
ADD CONSTRAINT unique_email UNIQUE (email);

/* On the other hand, if we need to remove a constraint, we use ALTER TABLE with DROP CONSTRAINT. This is useful when a constraint is no longer necessary or becomes too restrictive. For example, if we decide that employees can have duplicate emails, we can remove the UNIQUE constraint using:*/

ALTER TABLE employees  
DROP CONSTRAINT unique_email;

/*5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.
Ans-
Constraints in SQL ensure that the data stored in a database remains accurate, consistent, and reliable. When an attempt is made to insert, update, or delete data in a way that violates these constraints, the database system prevents the operation and raises an error. This helps maintain data integrity and prevents invalid data from being stored. 
1. Inserting Data That Violates Constraints
When inserting a new record, the database checks whether the values comply with all constraints. If any constraint is violated, the insertion fails.

Example: Violating a NOT NULL Constraint

2. Updating Data That Violates Constraints
When updating a record, the database ensures that the new values comply with all existing constraints. If an update violates a constraint, the database prevents the change.

Example: Violating a CHECK Constraint

3. Deleting Data That Violates Constraints
Deleting a record may cause issues if it is referenced by a FOREIGN KEY in another table. In such cases, the database prevents deletion unless ON DELETE CASCADE or ON DELETE SET NULL is defined.

Example: Violating a FOREIGN KEY Constraint
*/

/*6. You created a products table without constraints as follows:

CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00

Ans-

Modifying the products Table to Add Constraints
When designing a database, constraints help ensure data integrity by enforcing rules on columns. In the original products table, no constraints were defined, which means that duplicate or NULL values could be inserted into product_id, and price could be left empty. To maintain data consistency, we need to modify the table by adding a primary key to product_id and setting a default value for price.
A primary key ensures that each record has a unique and non-null identifier, preventing duplicate entries. Since the product_id column lacks a constraint, we can modify it using the ALTER TABLE statement:

ALTER TABLE products  
ADD CONSTRAINT pk_product PRIMARY KEY (product_id);
This command ensures that product_id cannot be NULL or contain duplicate values, making it the unique identifier for each product.

Additionally, to prevent missing or NULL values in the price column, we can set a default value of 50.00. This means that if a price is not provided during an insert operation, it will automatically be set to 50.00. We can achieve this with:

ALTER TABLE products  
ALTER COLUMN price SET DEFAULT 50.00;
After these modifications, the table now enforces stricter data integrity rules. The primary key constraint prevents duplicate or NULL product_id values, while the default value for price ensures that every product has a meaningful price, even if it is not explicitly specified. These changes improve data reliability and reduce the risk of inconsistent or missing information.

*/

/* 7.Write a query to fetch the student_name and class_name for each student using an INNER JOIN

Ans- */

SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;

/*    SQL COMMANDS  */

1.
