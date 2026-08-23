# COMSC 3013 — Computer Architecture

**Fall 2026**  
**Section:** COMSC-3013-1438

> **Status: Fall 2026 course-owned syllabus source.** This file is reconciled to the current course repository. Canvas should receive a student-facing copy of this syllabus. Exact due dates, current links, and announcements in Canvas control day-to-day operations when they are more specific than this document. Historical Word syllabi are retained under `docs/syllabus_sources/` as provenance, not as current policy.

## Instructor contact information

- **Instructor:** Jeremy Evert
- **Office:** Stafford 320
- **Office phone:** 580-774-7050
- **Email:** jeremy.evert@swosu.edu
- **GitHub:** https://github.com/jeremy-evert

Email is the best channel for administrative questions and anything that needs a written record. For technical help, email can be used to arrange an in-person or Zoom meeting. Use the current Canvas/Discord links when the course shell provides them.

### Office hours

| Day | Posted hours |
|---|---|
| Monday | 9:00–10:00 AM; 11:00 AM–12:00 PM |
| Tuesday | 10:00 AM–12:00 PM |
| Wednesday | 9:00–10:00 AM; 11:00 AM–12:00 PM |
| Thursday | 10:00 AM–12:00 PM |
| Friday | 9:00–10:00 AM; 11:00 AM–12:00 PM |

Additional meetings may be arranged by appointment. The canonical cross-course source is `swosu_cs_curriculum/shared/operations/office_hours/README.md`; update that source first if the schedule changes.

## Course information

| Field | Fall 2026 value |
|---|---|
| Course | COMSC 3013 — Computer Architecture |
| Section | COMSC-3013-1438 |
| Modality | Online / asynchronous |
| Meeting | No scheduled Banner meeting time |
| Location | Weatherford Campus (Main), Online W 1 / Online |
| Term | Fall 2026, Aug 17–Dec 11, 2026; finals Dec 7–11 |
| Prerequisite | None |

## Course description

Study of a modern computer system as a layered structure: digital logic, microprogramming, Von Neumann machines, operating systems, assembly and high-level virtual machines, emphasizing fundamental concepts at each layer and relationships between layers.

## Course purpose

Learn to investigate a machine with reproducible evidence. The course moves from observation and repeatability to representation/ISA/CPU behavior, memory hierarchy, virtual memory and I/O, parallelism, specialization, and an evidence-backed architecture redesign.

## Required materials and resources

- Canvas access and a reliable computer/internet connection.
- No required commercial textbook, ZyBooks subscription, paid AI subscription, or paid AI command-line agent.
- Course-authored materials, open references, and freely accessible tools form the required path.
- RISC-V is the planning-leading teaching ISA. Exact simulator/tool instructions are provided in the current course module; no student is graded for owning premium hardware or private compute.

Materials used in connection with this course may be subject to copyright protection. See the U.S. Copyright Office at https://www.copyright.gov/.

## Course learning goals

1. Inspect and measure machine behavior rather than relying on labels or marketing claims.
2. Connect software meaning, representation, ISA instructions, and processor-visible state.
3. Explain datapath/control, pipelining, memory hierarchy, virtual memory/protection/I/O, parallel scaling, and specialization using evidence.
4. Design reproducible bounded experiments with traces, measurements, plots, simulator state, or source/binary evidence.
5. Build and revise a Machine Dossier that records claims, evidence, uncertainty, and design choices.
6. Use AI as an investigation aid while distinguishing tool suggestions from independently verified evidence.

## Learning activities and assignments

- Semester kickoff and recurring AI Fluency / Professional Minds touchpoints.
- Weekly Architecture investigations with reproducible evidence receipts.
- Short Explain / Defend receipts that turn raw output into an evidence-backed claim.
- Machine Dossier checkpoints in Weeks 6, 9, and 14.
- Professional-pathway work in Weeks 14–15.
- Week 17 final reflection; Week 16 learning is ungraded under the dead-days posture.

Assignments are evidence-bearing work. Students should show what they tried, what happened, and why the evidence supports or challenges the conclusion. Canvas is authoritative for the exact submission location and due timestamp.

## Course schedule

| Week | Theme | Purpose / evidence |
|---:|---|---|
| 1 | Success Foundations | Orientation and course launch; no Architecture gate. |
| 2 | AI Lab Training | Use AI to investigate without treating it as source of truth. |
| 3 | Containers & Repeatability | Reproducibility receipt. |
| 4 | Linux as a Machine Telescope | Observe what the machine is doing. |
| 5 | Build the Machine | Machine Dossier v0; hierarchy/economics. |
| 6 | Bits Become Instructions | Checkpoint 1: representation/ISA evidence chain. |
| 7 | Crack Open the CPU | Datapath/control trace. |
| 8 | Make It Fast Without Breaking It | Pipeline/performance evidence and sensitivity plot. |
| 9 | Follow the Program Down | Checkpoint 2: full-stack source-to-CPU integration. |
| 10 | Make the Memory Hierarchy Hurt | Cache/locality/latency/bandwidth. |
| 11 | The Useful Lie of Memory | Virtual memory, protection, I/O mechanisms. |
| 12 | More Cores, More Problems | Scaling/communication evidence. |
| 13 | Different Machines for Different Work | CPU/vector/GPU/accelerator workload fit. |
| 14 | Sit in the Architect’s Chair | Checkpoint 3: final Machine Dossier redesign/defense. |
| 15 | Thanksgiving Wind-Down | Curation/catch-up; no new Architecture theory. |
| 16 | Farkle + Machine Learning | Shared applied experience; ungraded Architecture work. |
| 17 | Reflection | Evidence-backed final reflection using frozen dossier/labs. |

The schedule may be adjusted when needed. Substantive changes will be communicated in Canvas and reconciled back to the course repository.

## Grading

| Category | Weight |
|---|---:|
| Semester kickoff week | 5% |
| AI Fluency / Monday Moment | 5% |
| Professional Minds – Wednesday | 5% |
| Professional Minds – Friday | 5% |
| Weekly Architecture / investigation work | 30% |
| Weekly Explain / Defend receipt | 10% |
| Machine Dossier checkpoints | 20% |
| Final reflection | 8% |
| Professional pathway – Week 14 update | 5% |
| Professional pathway – Week 15 submission | 5% |
| Course evaluation | 2% |
| **Total** | **100%** |

**Grading scale:** A = 90–100%; B = 80–89%; C = 70–79%; D = 60–69%; F = below 60%. Rubrics and course-specific drop/revision rules are owned by the current repository grading model.

## Attendance and participation

This is an asynchronous online course with no scheduled Banner meeting time and no attendance category. Participation is demonstrated through the course evidence, investigations, explanations, and submissions. The M/W/F 2:00 PM rhythm used in planning is an instructional release/work cadence, not a required class meeting.

## Late work, revision, and recovery

The computing curriculum uses a shared continuous late-work default unless a course source explicitly overrides it. Work is graded for academic quality first. Effective lateness then reduces that earned score continuously at 1% per 24 hours late, including fractional days, after any instructor-granted excused late time. Assignments may remain open after the due date so recovery is still worthwhile, subject to the real end-of-semester grading boundary. Revisions/resubmissions may be accepted where the course workflow permits them; course-specific highest-score and drop-lowest rules in the repository control when applicable. Canvas holds the authoritative due/submission timestamps.

## Artificial intelligence and outside resources

AI is welcome as a learning and investigation tool when the assignment permits it. Students may use AI to brainstorm, explain, compare approaches, debug, revise, or propose code. AI is not the authority for the submitted work. Students remain responsible for accuracy, originality, privacy, and academic integrity. When AI materially contributes, disclose the tool and what it did, then name the independent evidence used to verify the result. A typical disclosure is: ‘I used [tool] for [role]. I verified the result with [test, run, source, calculation, comparison, or explanation].’

## Academic integrity and plagiarism

Academic integrity is expected and required. Sharing, copying, or collaborating is allowed only when the assignment permits it and each student’s contribution is represented accurately. Work from another person, source, or AI system must be acknowledged when required. Suspected violations are handled under the current SWOSU Student Handbook and academic-integrity policy.

Current policy: https://bulldog.swosu.edu/publications/handbooks/student/academic-dishonesty.php

## Accessibility and accommodations

Students who need accommodations should work with the Dean of Students / Student Services and communicate with the instructor as early as possible so approved accommodations can be implemented. Current information is available through SWOSU Student Services and the Student Handbook.

Disability services: https://bulldog.swosu.edu/student-services/dean-students/students-disabilities.php

## Title IX and pregnancy/related conditions

SWOSU is committed to an educational, living, and working environment free from sex-based discrimination, harassment, and misconduct. Current Title IX information, pregnancy/related-condition accommodations, reporting options, and coordinator contact information are available on the SWOSU Title IX page. The January 2026 university syllabus template identifies the Title IX and Compliance Coordinator in HAB 204-A, 580-774-3108.

Title IX: https://bulldog.swosu.edu/student-services/dean-students/title-ix.php

## Student support services

Canvas includes Resources for Student Success. SWOSU also provides tutoring, the Writing Center, online tutoring/writing support through Upswing, library and technology resources, and health/well-being services. If you are unsure which resource fits, ask the instructor and we will help locate the right door.

Writing Center: https://bulldog.swosu.edu/student-services/writing-center/index.php

## Instructor participation and course changes

The instructor will maintain regular course presence through teaching materials, feedback, office hours, announcements, and course-specific interaction. This syllabus may be updated when necessary. Students will be notified of substantive changes, and the repository should be updated so the syllabus and the course remain the same story.

## Source-of-truth note

For Fall 2026, this syllabus must remain consistent with `course_metadata.yaml`, the current `planning/` semester/course map, `docs/grading-model.md`, and shared curriculum policies. Historical syllabi and templates are starting evidence, not permission to reintroduce retired rooms, textbooks, grading rules, attendance ladders, or course rhythms.
