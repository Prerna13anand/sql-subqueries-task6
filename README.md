# sql-subqueries-task6
SQL Developer Internship - Task 6: Subqueries and Nested Queries
This repository contains my submission for the sixth SQL task, which focuses on using subqueries (or nested queries) to solve complex data retrieval problems.

Project Summary
The SQL script in this repository demonstrates the use of subqueries in various clauses (WHERE, FROM, SELECT). The script first sets up a sample database for an online bookstore and then runs five distinct queries. Each query answers a specific question that requires nesting one query inside another, showcasing concepts like scalar subqueries, derived tables, and using operators like IN and EXISTS.

The script was tested using DB Fiddle with SQLite.

Interview Questions & Answers
1. What is a subquery?
A subquery, also known as a nested query or inner query, is a SQL query that is placed inside another SQL query.

2. Difference between subquery and join?
A JOIN combines columns from two or more tables into a single result set. A subquery uses the result of an inner query to determine the results of an outer query; it can return a single value, a single column, or multiple rows, which are then used by the outer query's WHERE, FROM, or SELECT clause.

3. What is a correlated subquery?
A correlated subquery is an inner query that depends on the outer query for its values. It is evaluated once for each row processed by the outer query, which can make it slower than a non-correlated subquery.

4. Can subqueries return multiple rows?
Yes. A subquery can return multiple rows when used with operators like IN or EXISTS in the WHERE clause, or when used as a derived table in the FROM clause.

5. How does EXISTS work?
The EXISTS operator is used to test for the existence of any records in a subquery. It returns TRUE if the subquery returns one or more records, otherwise it returns FALSE. It is often more efficient than IN because it can stop processing as soon as it finds a matching row.

6. How is performance affected by subqueries?
Performance can be negatively affected, especially by correlated subqueries that run for every row of the outer query. In many cases, a JOIN is more performant than a subquery. However, modern database optimizers are very good at rewriting queries, and sometimes a subquery can be clearer and just as fast.

7. What is scalar subquery?
A scalar subquery is a subquery that returns exactly one row with one column. This single value can then be used in the SELECT list or WHERE clause of the outer query, just like a literal value or variable.

8. Where can we use subqueries?
Subqueries can be used in several places within a larger statement, most commonly in the SELECT list, the FROM clause (as a derived table), and the WHERE or HAVING clauses for filtering.

9. Can a subquery be in FROM clause?
Yes. When a subquery is used in the FROM clause, it is treated as a temporary, virtual table for the main query to select from. This is often called a "derived table".

10. What is a derived table?
A derived table is the result set of a subquery that is used in the FROM clause of an outer query. It's a temporary table that exists only for the duration of the query.
