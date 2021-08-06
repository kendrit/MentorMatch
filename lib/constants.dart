import 'package:flutter/cupertino.dart';

class Constants {
  static const Color maingreen = Color(0xff3ade9f);
  static const Color mainblue = Color(0xff4cfff6);
  static const Color darkgray = Color(0xff707070);
  static const Map Rubric = {
    "career": {
      "weight": 0.5,
      "diffweight": 0.25,
      "career stage": {
        "0": 0,
        "1": 5.5,
        "2": 6.5,
        "3": 7.0,
        "4": 7.5,
      },
      "work field": {
        "weight": 0.2,
        "Chemical": 0,
        "Civil": 1,
        "Mechanical": 2,
        "Electrical": 3,
        "Software": 4,
      },
      "major": {
        "weight": 0.2,
        // Chemical
        "Agricultural and Biological Engineering": 0,
        "Bioengineering": 0,
        "Chemical and Biomolecular Engineering": 0,
        "Materials Science and Engineering": 0,
        "Nuclear, Plasma, and Radiological Engineering": 0,
        // Civil
        "Civil and Environmental Engineering": 1,
        "Industrial Engineering": 1,
        "Structural Engineering": 1,
        // Mechanical
        "Aerospace Engineering": 2,
        "Engineering Mechanics": 2,
        "Physics": 2,
        "Mechanical Engineering": 2,
        // Electrical
        "Electrical Engineering": 3,
        "Computer Engineering": 3,
        // Software
        "Computer Science": 4,
        "Systems Engineering and Design": 4,
        "Data Science": 4,
      },
      "work type": {
        "weight": 0.15,
        "Academia": 0,
        "Governmental": 1,
        "Non-Profit": 2,
        "Private": 3,
        "Entrepeneurship": 4,
      },
      "team preference": {
        "weight": 0.075,
        "0": 0,
        "1": 1,
        "2": 2,
        "3": 3,
        "4": 4
      }
    },
    "briggs": {"weight": 0.35},
    "personality": {
      "weight": 0.15,
      "diffweight": 1 / 3,
      "driving choice": {
        "weight": 0.03,
        "diffweight": 1 / 3,
        "Listening to music": 0,
        "Listening to a podcast": 1,
        "Thinking about responsibilities/multitasking": 2,
        "I despise driving": 3,
      },
      "living choice": {
        "weight": 0.06,
        "A location that is best for my family": 0,
        "A location that is a good balance for my family and career": 1,
        "A location that is best for my career": 2,
        "I would try to make everything work in a specific location I enjoy": 3,
      },
      "future choice": {
        "weight": 0.06,
        "I am willing to sacrifice my comfort in order to make the world a better place.":
            0,
        "I want to go out of my way to help the world around me, but only after making sure I am comfortable.":
            1,
        "I will choose/have chosen an employer that will help make the world a better place, and trust that my work with them is enough.":
            2,
        "I do not have any preference on my career and its impact.": 3
      },
    }
  };
}
