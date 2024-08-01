package printScoreBoard;

public enum SortingConditionType {
    NAME("name"),
    KOR("kor"),
    ENG("eng"),
    MATH("math"),
    TOTAL("total"),
    AVERAGE("average");

    private final String value;

    SortingConditionType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
