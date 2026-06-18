public class FinancialForecasting {

    // Recursive method to calculate future value
    public static double futureValue(double currentValue, double growthRate, int years) {

        // Base case
        if (years == 0) {
            return currentValue;
        }

        // Recursive case
        return futureValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }

    public static void main(String[] args) {

        double presentValue = 10000; // Initial investment
        double growthRate = 0.10;    // 10% growth
        int years = 5;

        double result = futureValue(presentValue, growthRate, years);

        System.out.println("Future Value after " + years + " years: " + result);
    }
}