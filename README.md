# ph-l2-assignment2

## 1. What is PostgreSQL?

**PostgresSQL** একটি ওপেন সোর্স, রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম। এটি এডভান্সড ডেটা টাইপ, JSON সাপোর্ট এর জন্য বিখ্যাত। ওয়েভ অ্যাপ, মোবাইল অ্যাপ এবং এন্টারপ্রাইজ সফটওয়্যারে এটি ব্যাপকভাবে ব্যবহৃত হয়।

## 2. What is the purpose of a database schema in PostgreSQL?

একটি **স্কিমা** হলো ডেটাবেজের ভিতরে একটি নেমস্পেস বা গ্রুপ, যেখানে টেবিল, ভিউ, ফাংশন ইত্যাদি সংরক্ষিত থাকে।

**উদ্দেশ্য:**

- টেবিল ও অন্যান্য অবজেক্টগুলোকে সুশৃঙ্খলভাবে সাজানো।
- একই নামের অবজেক্টের মধ্যে কনফ্লিক্ট এড়ানো।
- পারমিশন নিয়ন্ত্রণ সহজ করা।


## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Primary Key** টেবিলের প্রতিটি সারিকে সুনির্দিষ্টভাবে শনাক্ত করে। এটি **ইউনিক** এবং **NULL** হতে পারে না।

**Foreign Key** এক টেবিলের কলামকে অন্য টেবিলের প্রাইমারি কি-এর সাথে সংযুক্ত করে।

## 4. What is the difference between the VARCHAR and CHAR data types?

**VARCHAR**

- **দৈর্ঘ্য** পরিবর্তন করা যায়।
- অতিরিক্ত **স্পেস** যোগ হয় না।
- সাধারণত বেশি ব্যবহৃত হয়।

**CHAR**

- **দৈর্ঘ্য** পরিবর্তন করা যায় না, নির্দিষ্ট হয়।
- n সংখ্যক ক্যারেক্টার না হলে স্পেস দিয়ে পূরণ হয়।
- খুব কম ব্যবহৃত, নির্দিষ্ট দৈর্ঘ্যের ডেটার জন্য।



## 5. Explain the purpose of the WHERE clause in a SELECT statement.

**WHERE** ক্লজ ডেটাবেজ থেকে শুধুমাত্র নির্দিষ্ট শর্ত অনুযায়ী ROW বাছাই করতে ব্যবহার হয়।


## 6. What are the LIMIT and OFFSET clauses used for?

- **LIMIT:** কতগুলো রেকর্ড দেখাবে তা নির্ধারণ করে।
- **OFFSET:** কয়টি রেকর্ড বাদ দিয়ে শুরু করবে তা নির্ধারণ করে।

## 7. How can you modify data using UPDATE statements?

```sql
UPDATE users
SET name = "Mehedi"
WHERE user_id = 1;
```