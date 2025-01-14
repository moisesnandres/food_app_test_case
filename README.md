# FoodApp Test Case

This is an application built with **Ruby on Rails** (backend) and **React** (frontend).

## Features

### Backend (Ruby on Rails)
- RESTful API implementation.
- Meal catalog with dynamic pricing and categories.
- RSpec tests for API endpoints.

### Frontend (React)
- **JWT-based user authentication**.
- Meal browsing with search and sorting functionality.
- Responsive design with reusable components.

## Prerequisites

- Ruby 3.x and Rails 7.x
- PostgreSQL (for Rails database)

## Setup

### Backend Setup

1. Clone the repository
```bash
git clone https://github.com/moisesnandres/food_app_test_case.git
cd food_app_test_case
```

2. Install dependencies
```bash
bundle install
```

3. Set up database
```bash
rails db:create db:migrate
rake data:fetch
```

4. Run the Rails server
```bash
rails server
```
