package com.example.revista_v1;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    Button btnGoToAuthors, btnGoToManuscripts, btnGoToReviewers, btnGoToReviews;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnGoToAuthors = findViewById(R.id.btnGoToAuthors);
        btnGoToManuscripts = findViewById(R.id.btnGoToManuscripts);
        btnGoToReviewers = findViewById(R.id.btnGoToReviewers);
        btnGoToReviews = findViewById(R.id.btnGoToReviews);

        btnGoToAuthors.setOnClickListener(v -> {
            startActivity(new Intent(getApplicationContext(),Authors.class));
        });

        btnGoToManuscripts.setOnClickListener(v -> {
            startActivity(new Intent(getApplicationContext(),Manuscripts.class));
        });

        btnGoToReviewers.setOnClickListener(v -> {
            startActivity(new Intent(getApplicationContext(),Reviewers.class));
        });

        btnGoToReviews.setOnClickListener(v -> {
            startActivity(new Intent(getApplicationContext(),Reviews.class));
        });


    }
}