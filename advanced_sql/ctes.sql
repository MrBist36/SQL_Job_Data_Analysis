WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skills_count
    FROM
        skills_job_dim AS skills_job
    INNER JOIN job_postings_fact AS job_posting ON job_posting.job_id = skills_job.job_id
    WHERE 
        job_posting.job_work_from_home = True AND
        job_posting.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skills_name,
    skills_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skills_count DESC
LIMIT 10;