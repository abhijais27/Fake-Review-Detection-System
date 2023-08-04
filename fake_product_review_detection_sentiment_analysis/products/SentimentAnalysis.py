import sys,csv,re
from textblob import TextBlob
import matplotlib.pyplot as plt
from django.db import connection

class SentimentAnalysis:

    def __init__(self):
        self.paragraphs = []
        self.paragraphText = []
    
    def performAnalysis(self, searchTerm):

        analysis = TextBlob(searchTerm)
        
        if (analysis.sentiment.polarity == 0):  # adding reaction of how people are reacting to find average later
            return 3
        elif (analysis.sentiment.polarity > 0 and analysis.sentiment.polarity <= 0.3):
            return 3.5
        elif (analysis.sentiment.polarity > 0.3 and analysis.sentiment.polarity <= 0.6):
            return 4
        elif (analysis.sentiment.polarity > 0.6 and analysis.sentiment.polarity <= 1):
            return 5
        elif (analysis.sentiment.polarity > -0.3 and analysis.sentiment.polarity <= 0):
            return 2.5
        elif (analysis.sentiment.polarity > -0.6 and analysis.sentiment.polarity <= -0.3):
            return 2
        elif (analysis.sentiment.polarity > -1 and analysis.sentiment.polarity <= -0.6):
            return 1
            
        return 1

    def getTitle(self, polarity):
        if (polarity == 3):
            return "Neutral"
        elif (polarity == 3.5):
            return "Weakly Positive"
        elif (polarity == 4 ):
            return "Positive"
        elif (polarity == 5):
            return "Strongly Positive"
        elif (polarity == 2.5):
            return "Weakly Negative"
        elif (polarity == 2):
            return "Negative"
        elif (polarity == 1):
            return "Strongly Negative"
        return "Strongly Negative"

    def getColor(self, polarity):
        if (polarity == 3):
            return "24, 78, 229"
        elif (polarity == 3.5):
            return "65, 238, 244"
        elif (polarity == 4 ):
            return "65, 244, 149"
        elif (polarity == 5):
            return "32, 229, 25"
        elif (polarity == 2.5):
            return "249, 144, 144"
        elif (polarity == 2):
            return "229, 24, 181"
        elif (polarity == 1):
            return "244, 65, 65"
        return "244, 65, 65"

