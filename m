Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D640928B
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524865; cv=none; b=QHJmXDY0wXCLQzrWrgSWBuDHCURl7DRFrk5rB1ZS2yk63iGbRB3WUrAjxi/EQ+ESEh+J27OtGHdzY2VQJVOjHes7XVAAaCIhdkkcVXXuiI+ImNrylOrKYmaoYiZweh3JZQcGDhUqORMz6emHSp/ukP6BX0zBbDV6kpJbceusXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524865; c=relaxed/simple;
	bh=MdMkvdVRw0ZgGHAVv7qX/N2NDQEYvDYBnx81INEUBWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1yU3lE2QlHNVYHFkIOA9tQtBjQYXAlmAJGpw4HgLhe0XgyW98JMtsH4h/wzm5JoeISfxAS6bm/JTT/vXnYuuBAmQQUfisv8sSHf408dxER3UacGg8kmC9+BDfnHbjaq7+8UtmUbYjiwAK20EeAwFeveQsD2+MQn/Bj2SGjch44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOKdpSYS; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOKdpSYS"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f3f52143cdso798857a34.2
        for <linux-leds@vger.kernel.org>; Fri, 04 Sep 2026 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524863; x=1789129663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGLh7xQtAAd514FqEegVwMoJiuYXFm4/mjW3gIL28o4=;
        b=dOKdpSYS3gFeMwOr110VZLMbLV6xIXbeIdFgjN9Kt7XbaVY4HjkdlfdGJNDYmdveQi
         wLdRw9ETxiGfCfnT3jgltIgOZuhEmFphVxN+qDFurZkj54L/DaM0tSHRzNuKrVsZtHK1
         omH1o13ijo4WN9wWXqdiJgmj/EZS5NFUI3ddG67VyWST5L2jF88eDqDSunjewgdoAAFY
         h6LulSOLUH+PTeP4w632IWzftBnQeFuNOd0DzRGL10zt9Z+/lIyXmYOMXbjy61jI70qc
         9bTKpC3kuzRslK3tSXvI9hSxcIJeB2sDqacMnOcXc0kwvr5iAioYsZCZaEJZlvuhluMA
         sUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524863; x=1789129663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGLh7xQtAAd514FqEegVwMoJiuYXFm4/mjW3gIL28o4=;
        b=pGEl47bmn5KMGbrMVR3f+Y1yBU20gc3+Ok+kjVeSe1B3PzYzAmdrK39G9pvNnNfw61
         M0o7LisXiLrK4qYj5cWk2NH77OT9Vijp0ik18UXSBz2LC/6YKZ7K99HaYbUZgukAj+Ec
         ayiCOzJHEpp1UIqM/xsAb43uTJA/44a4DRWnsdV7Es7BRfesHh+tDech8+vAx2pDfPjX
         7y1WBcqyZHiq+1bVWHDD6Zl1ptqXI4F1H4JczI8Z4X7hWHQNIqaTR4OLhDz2XK7cWyd1
         TCoTdLPn/weh0YEn7NSFcNUS7g4qkknTo4b4dshEkAxDOcAanOkgHhXX8Xa0/ScSRHht
         7bLg==
X-Forwarded-Encrypted: i=1; AKwUvBwDbv+Q3YbMejMgtkiF8WqAjsnlcEl3IyUYuZgmVjWRQNpYvzkrZxIo4p/+UWSKOJgt0i3CtjWJwC5X@vger.kernel.org
X-Gm-Message-State: AFuF++k/SyMJSpV4dH0/SLMsbwTqe8B1XoLGmg5jivWML0RR7PSKLhQw
	zrhi+F0CTHI3k/XRp3vch4rgVFlNa/0Cy6K7v6FQ+x4yloyJse4BBgxM
X-Gm-Gg: AYBFou0U52p+FU8/69YpxFBydodAq8axGd+5aUKdoNJcek6Pf2Qs2G1uos85X/xs2j+
	j0NZ2KCi45j1kV+6GvFDa48LrIlmczjfbPqf9HLkc8gsOHORuLpw56OG7QkjsVHNuIKD4//CGLY
	prb/sE7IwQVmcvl3ZJkQJlJXeyZPzEdHKg1BO+5r2HSnU1auUupraj1VjtRx1l3k4qjja5hHj+E
	k1gtvIPDr7I04Ne7P5M7ASGKJBoiz2r54RWdx03g12qOXNiDd43RRr/Ih1zuESikMnsdhSJNwg1
	/x9WrpaAUfJFI4GS/HOBkZ+4Sq1Q4MuOuY3nYYBrTz6N8jbekhfSyASHW1KB5HGXwI2DgK1fui5
	jWSqIqMkVfbR6TC55lH8Q8STVzLuqmtxvaPa6UzOiarrSHIQ9JrYeNK4iyKEZV9ZhydJFp5Z9oF
	KZpT4nIQWbUGQ0ybe6RKZLmZETovllSmOLHExhdGX0Z7WMyK0ns6hHiwP2lYOu9ZuspXYsOk+sq
	mNLZGOWrKs3aE8=
X-Received: by 2002:a05:6820:198c:b0:6b4:117e:543 with SMTP id 006d021491bc7-6b6fc5dc03amr4605135eaf.21.1788524863132;
        Fri, 04 Sep 2026 05:27:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm6347207eec.14.2026.09.04.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:27:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: fix typo "retrive" in comment
Date: Fri,  4 Sep 2026 17:57:37 +0530
Message-ID: <20260904122738.33145-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/leds/leds-ss4200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index f24ca75c7cb1..c782339b1330 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -339,7 +339,7 @@ static void ich7_lpc_cleanup(struct device *dev)
 
 /*
  * The OS has determined that the LPC of the Intel ICH7 Southbridge is present
- * so we can retrive the required operational information and prepare the GPIO.
+ * so we can retrieve the required operational information and prepare the GPIO.
  */
 static struct pci_dev *nas_gpio_pci_dev;
 static int ich7_lpc_probe(struct pci_dev *dev,
-- 
2.48.1

