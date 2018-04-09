import java.util.HashSet;
import java.util.Random;

public final class ProjectInputGenerator {
	// --------------------------------------------------
	// Static Variables
	// --------------------------------------------------

	// Make sure that ALPHA_NUM_LOWER.length > 10.
	// Do not change unless you wish to reduce range of alphabet.
	private static final char[] ALPHA_NUM_LOWER = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
			'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9' };

	// Make sure that MATERIALS.length != 0 and that
	// at least one of the entries is non-empty.
	private static final String[] MATERIALS = { "glass", "metal", "plastic", "liquid" };

	// Make sure that MAX_NUM_MATERIALS > 0.
	private static final int MAX_NUM_MATERIALS = 10;

	// Make sure that STR_MAX_LEN > 0.
	// Maximum length of PID and CID.
	private static final int STR_MAX_LEN = 7;

	// Make sure that INITIAL_NEW_PHASES > 0.
	private static final int INITIAL_NEW_PHASES = 10;

	// Make sure that INITIAL_NEW_TRACKERS > 0.
	private static final int INITIAL_NEW_TRACKERS = 10;

	// Make sure that INITIAL_NEW_CONTAINERS > 0.
	private static final int INITIAL_NEW_CONTAINERS = 10;

	// Make sure that MAX_NUM_GENERATED_COMMANDS > 0.
	private static final int MAX_NUM_GENERATED_COMMANDS = 3000;

	// Make sure that NUM_COMMANDS > 0.
	// The only hard-coded part which signifies how
	// many commands exist except UNDO/REDO.
	private static final int NUM_COMMANDS = 6;

	// Make sure that MAX_NUM_UNDOS > 0.
	private static final int MAX_NUM_UNDOS = 5;

	// Make sure that MAX_NUM_REDOS > 0.
	private static final int MAX_NUM_REDOS = 5;

	// --------------------------------------------------
	// Start of "Do NOT change region".
	//
	// Do NOT change under any circumstances.
	// --------------------------------------------------

	private static final String UNDO = "undo";

	private static final String REDO = "redo";

	// Enforce lower case entries for ALPHA_NUM_LOWER.
	static {
		for (int i = 0; i < ALPHA_NUM_LOWER.length; i++) {
			ALPHA_NUM_LOWER[i] = Character.toLowerCase(ALPHA_NUM_LOWER[i]);
		}
	}

	// Used for memory allocation efficiency.
	private static int MAX_MATERIAL_LEN = 0;
	static {
		// Set MAX_MATERIAL_LEN.
		for (int i = 0; i < MATERIALS.length; i++) {
			MAX_MATERIAL_LEN = Math.max(MAX_MATERIAL_LEN, MATERIALS[i].length());
		}
	}

	private static final Random RAN_GEN = new Random();

	// --------------------------------------------------
	// End of "Do NOT change region".
	// --------------------------------------------------

	// --------------------------------------------------
	// Non-Static Variables
	// --------------------------------------------------

	private long last_max_container_radiation;

	private long sum_all_container_radiations;

	private HashSet<String> pids;

	private HashSet<String> cids;

	// --------------------------------------------------
	// Constructor
	// --------------------------------------------------

	private ProjectInputGenerator() {
		this.last_max_container_radiation = 0;
		this.sum_all_container_radiations = 0;
		this.pids = new HashSet<String>();
		this.cids = new HashSet<String>();
	}

	// --------------------------------------------------
	// HashSet Helper
	// --------------------------------------------------

	private static String[] toArray(HashSet<String> h) throws NullPointerException {
		if (h == null) {
			throw new NullPointerException("h == null");
		}

		// Convert h to an array.
		String[] result = h.toArray(new String[h.size()]);
		return result;
	}

	// --------------------------------------------------
	// Main
	// --------------------------------------------------

	public static void main(String[] args) throws IllegalStateException {
		if (ALPHA_NUM_LOWER.length < 10) {
			throw new IllegalStateException("ALPHA_NUM_LOWER.length == " + ALPHA_NUM_LOWER.length + " < 10");
		} else if (MATERIALS.length == 0) {
			throw new IllegalStateException("MATERIALS.length == 0");
		} else if (MAX_NUM_MATERIALS <= 0) {
			throw new IllegalStateException("MAX_NUM_MATERIALS == " + MAX_NUM_MATERIALS + " <= 0");
		} else if (STR_MAX_LEN <= 0) {
			throw new IllegalStateException("STR_MAX_LEN == " + STR_MAX_LEN + " <= 0");
		} else if (INITIAL_NEW_PHASES <= 0) {
			throw new IllegalStateException("INITIAL_NEW_PHASES == " + INITIAL_NEW_PHASES + " <= 0");
		} else if (INITIAL_NEW_TRACKERS <= 0) {
			throw new IllegalStateException("INITIAL_NEW_TRACKERS == " + INITIAL_NEW_TRACKERS + " <= 0");
		} else if (INITIAL_NEW_CONTAINERS <= 0) {
			throw new IllegalStateException("INITIAL_NEW_CONTAINERS == " + INITIAL_NEW_CONTAINERS + " <= 0");
		} else if (MAX_NUM_GENERATED_COMMANDS <= 0) {
			throw new IllegalStateException("MAX_NUM_GENERATED_COMMANDS == " + MAX_NUM_GENERATED_COMMANDS + " <= 0");
		} else if (NUM_COMMANDS <= 0) {
			throw new IllegalStateException("NUM_COMMANDS == " + NUM_COMMANDS + " <= 0");
		} else if (MAX_NUM_UNDOS <= 0) {
			throw new IllegalStateException("MAX_NUM_UNDOS == " + MAX_NUM_UNDOS + " <= 0");
		} else if (MAX_NUM_REDOS <= 0) {
			throw new IllegalStateException("MAX_NUM_REDOS == " + MAX_NUM_REDOS + " <= 0");
		} else if (MAX_MATERIAL_LEN == 0) {
			throw new IllegalStateException("MAX_MATERIAL_LEN == 0");
		}

		// Input generator.
		final ProjectInputGenerator p = new ProjectInputGenerator();

		// Generate INITIAL_NEW_PHASES many phases.
		for (int i = 0; i < INITIAL_NEW_PHASES; i++) {
			System.out.println(p.new_phase());
		}
		// Generate INITIAL_NEW_TRACKERS many trackers.
		for (int i = 0; i < INITIAL_NEW_TRACKERS; i++) {
			System.out.println(p.new_tracker());
		}

		// Generate INITIAL_NEW_CONTAINERS many containers.
		for (int i = 0; i < INITIAL_NEW_CONTAINERS; i++) {
			System.out.println(p.new_container());
		}

		// Generate MAX_NUM_GENERATED_COMMANDS many more commands.
		for (int i = 0; i < MAX_NUM_GENERATED_COMMANDS; i++) {
			int r = RAN_GEN.nextInt(NUM_COMMANDS);
			if (r == 0) {
				System.out.println(p.new_phase());
			} else if (r == 1) {
				System.out.println(p.new_tracker());
			} else if (r == 2) {
				System.out.println(p.new_container());
			} else if (r == 3) {
				System.out.println(p.remove_phase());
			} else if (r == 4) {
				System.out.println(p.remove_container());
			} else { // (r == 5)
				System.out.println(p.move_container());
			}

			// Decide whether to do UNDO commands or not.
			if (RAN_GEN.nextBoolean()) {
				int num_undos = nextPositiveInt(MAX_NUM_UNDOS);
				while (num_undos-- > 0) {
					System.out.println(UNDO);
				}
			}

			// Decide whether to do REDO commands or not.
			if (RAN_GEN.nextBoolean()) {
				int num_redos = nextPositiveInt(MAX_NUM_REDOS);
				while (num_redos-- > 0) {
					System.out.println(REDO);
				}
			}
		}
	}

	// --------------------------------------------------
	// Random Generators
	// --------------------------------------------------

	private static int nextPositiveInt(int bound) {
		return (RAN_GEN.nextInt(Math.min(Integer.MAX_VALUE, Math.abs(bound))) + 1);
	}

	private static int nextNumMaterials() {
		return nextPositiveInt(MAX_NUM_MATERIALS);
	}

	private static int nextStrLen() {
		return nextPositiveInt(STR_MAX_LEN);
	}

	private static long nextUnsignedLong() {
		return Math.abs(RAN_GEN.nextLong());
	}

	private static String nextUnsignedLongString() {
		return Long.toString(nextUnsignedLong());
	}

	private static char nextLowerAlphaNum() {
		return ALPHA_NUM_LOWER[RAN_GEN.nextInt(ALPHA_NUM_LOWER.length)];
	}

	private static StringBuilder nextStringBuilder() {
		final int capacity = nextStrLen();
		StringBuilder s = new StringBuilder(capacity);
		for (int i = 0; i < capacity; i++) {
			if (RAN_GEN.nextBoolean()) {
				s.append(nextLowerAlphaNum());
			} else {
				s.append(Character.toUpperCase(nextLowerAlphaNum()));
			}
		}
		return s;
	}

	private static String nextString() {
		return nextStringBuilder().toString();
	}

	private static String nextMaterial() {
		return MATERIALS[RAN_GEN.nextInt(MATERIALS.length)];
	}

	private static String nextMaterials() {
		final int numMaterials = nextNumMaterials();

		/*
		 * Initial capacity for the StringBuilder is 2 for "<<" plus numMaterials times maximum
		 * length of all materials but also taking commas into account and finally another 2 for
		 * ">>".
		 */
		StringBuilder s = new StringBuilder(2 + numMaterials * (MAX_MATERIAL_LEN + 1) + 2);

		s.append("<<");
		s.append(nextMaterial());
		for (int i = 1; i < numMaterials; i++) {
			s.append(",");
			s.append(nextMaterial());
		}
		return s.append(">>").toString();
	}

	private String nextContainer() {
		final long container_radiation_upper_bound = this.last_max_container_radiation
				- this.sum_all_container_radiations;
		final long container_radiation = container_radiation_upper_bound <= 0 ? 0
				: nextUnsignedLong() % (container_radiation_upper_bound + 1);
		this.sum_all_container_radiations += container_radiation;

		// Output
		return ("[" + nextMaterial() + ",\"" + container_radiation + "\"]");
	}

	// --------------------------------------------------
	// Commands
	// --------------------------------------------------

	public String new_phase() {
		// Generate a new PID.
		String pid = nextString();
		while (this.pids.contains(pid)) {
			pid = nextString();
		}
		this.pids.add(pid);

		// Output
		return ("new_phase(" + pid + "," + nextString() + "," + nextUnsignedLongString() + "," + nextMaterials() + ")");
	}

	public String new_tracker() {
		final long max_phase_radiation = nextUnsignedLong();
		final long max_container_radiation = nextUnsignedLong() % max_phase_radiation;
		this.last_max_container_radiation = max_container_radiation;

		// Output
		return ("new_tracker(\"" + max_phase_radiation + "\",\"" + max_container_radiation + "\")");
	}

	public String new_container() throws IllegalStateException {
		if (this.pids.isEmpty()) {
			throw new IllegalStateException("this.pids.isEmpty()");
		}

		// Generate a new CID.
		String cid = nextString();
		while (this.cids.contains(cid)) {
			cid = nextString();
		}
		this.cids.add(cid);

		// Pick a random existing PID.
		final String[] pids = toArray(this.pids);
		final String pid = pids[RAN_GEN.nextInt(pids.length)];

		// Output
		return ("new_container(" + cid + "," + nextContainer() + "," + pid + ")");
	}

	public String remove_phase() throws IllegalStateException {
		if (this.pids.isEmpty()) {
			throw new IllegalStateException("this.pids.isEmpty()");
		}

		// Pick a random existing PID.
		final String[] pids = toArray(this.pids);
		return ("remove_phase(" + pids[RAN_GEN.nextInt(pids.length)] + ")");
	}

	public String remove_container() throws IllegalStateException {
		if (this.cids.isEmpty()) {
			throw new IllegalStateException("this.cids.isEmpty()");
		}

		// Pick a random existing CID.
		final String[] cids = toArray(this.cids);
		return ("remove_container(" + cids[RAN_GEN.nextInt(cids.length)] + ")");
	}

	public String move_container() throws IllegalStateException {
		if (this.cids.isEmpty()) {
			throw new IllegalStateException("this.cids.isEmpty()");
		} else if (this.pids.size() < 2) {
			throw new IllegalStateException("this.pids.size() == " + this.pids.size() + " < 2");
		}

		// Pick a random existing CID.
		final String[] cids = toArray(this.cids);
		final String cid = cids[RAN_GEN.nextInt(cids.length)];

		// Pick two random existing PIDs.
		final String[] pids = toArray(this.pids);
		int index1 = RAN_GEN.nextInt(pids.length);
		int index2 = RAN_GEN.nextInt(pids.length);
		while (index2 == index1) {
			index2 = RAN_GEN.nextInt(pids.length);
		}
		final String pid1 = pids[index1];
		final String pid2 = pids[index2];

		// Output
		return ("move_container(" + cid + "," + pid1 + "," + pid2 + ")");
	}
}
