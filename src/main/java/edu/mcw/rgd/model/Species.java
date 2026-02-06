package edu.mcw.rgd.model;

public enum Species {
    HUMAN("Human", 9606),
    MOUSE("Mouse", 10090),
    RAT("Rat", 10116),
    CHINCHILLA("Chinchilla", 34839),
    BONOBO("Bonobo", 9597),
    DOG("Dog", 9615),
    SQUIRREL("Squirrel", 43179),
    ZEBRAFISH("Zebrafish", 7955),
    PIG("Pig", 9823),
    FLY("Fly", 7227),
    ROUNDWORM("Roundworm", 6239),
    YEAST("Yeast", 559292),
    GREEN_MONKEY("Green Monkey", 60711),
    NAKED_MOLE_RAT("Naked Mole-Rat", 10181),
    AFRICAN_CLAWED_FROG("African Clawed Frog", 8355),
    TROPICAL_CLAWED_FROG("Tropical Clawed Frog", 8364),
    BLACK_RAT("Black Rat", 10117);

    private final String displayName;
    private final int taxonId;

    Species(String displayName, int taxonId) {
        this.displayName = displayName;
        this.taxonId = taxonId;
    }

    public String getDisplayName() {
        return displayName;
    }

    public int getTaxonId() {
        return taxonId;
    }

    public static Species getByTaxonId(int taxonId) {
        for (Species species : values()) {
            if (species.taxonId == taxonId) {
                return species;
            }
        }
        return null;
    }
}
