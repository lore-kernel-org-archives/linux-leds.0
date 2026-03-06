Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E4330B09
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772773727; cv=none; b=J/OelFP6MxfHkhq4MM09AHHfD1L8nzoqwFevaHP3KM4ve8ynvXNJyfhQAbjQ1CNRB00bgeUdPWdqa4b2orCFq2B1H0SLgH0D/4M2MryBFbwo5YIyC+0Qtw+FCPjZXF5243g9MjpwiNk//7AjHWovpIxxshgTzF4OZFUfJEoj0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772773727; c=relaxed/simple;
	bh=PdMDHq5EUO2fdv0bdJPExV2lHZaY++QS+BVZmwwrj/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLZP8z4EMoOsGJgm5XRGSd/YP4Qq8f++FvND12VNzBNC32Kv4NhBPPU4ntb4oCl1FYHcCwttw1IFthO5k41C/3w6VY7ig2ELWjvigFfEgBuECHdP18lW27lOhEDHqXEofL6jAWT/1QNWeCTqbFrossBGT/CN8Dwlrj/4tMakWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=Q+stw7F5; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="Q+stw7F5"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3599126be32so2950146a91.1
        for <linux-leds@vger.kernel.org>; Thu, 05 Mar 2026 21:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772773726; x=1773378526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4fjok2wqVAi2c7hCzleME/dDvDBSpJ7frTaQaxYcXQ=;
        b=Q+stw7F5UWOqsjA0oKWE/r7ho8F4Lf1+08exPnZvQxbVRDukhJgn3aeOMYRZoX5XmF
         7PDZRqL2NQXB5R9FAjwSESfwxZ7zZtqxmWOm7C/NCq1X3v/1K/E4hFl2tj3CmBzuOZOw
         Ru56LjW19w/RCpCllJSTz7Vs5goxt0MJrBCiEACqayy84RhghUrtl3rmjYVIktG3yaw+
         9/4vJh19WDsVKI12yQ5Kij2CeR+Pp8xsRmYS8cLYwueMZzxo46tHrOO2dCIJ6pYiZ2DE
         9SxilJEsHKRg+FpskE3BSA6Zt8mw+RywlQOQTfRVtXzHCjGd/RCZJOxIeF1ObUyGEht7
         Lx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772773726; x=1773378526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4fjok2wqVAi2c7hCzleME/dDvDBSpJ7frTaQaxYcXQ=;
        b=HShTK5BNk0Idsn3CtKErSCfO7idJ/A2UclrtKvtEIz5BhpAgCPt+j6mk3FSD7frCUl
         ljNe7dsiRIGFv2gWk28RLpeSFmWziwZF/nWXIcVAHHJiuo962glS/AamByYSNQV0Y9sP
         L7rfzRA65+E0BKvwApAxilXkziLyi+8fR2zzoTnt+4DDJTWT+dhNubIAuodc2ZS7llx2
         SQD0TcySzw3nFk1DBq0TAge4gdmlM8uEO9Dwn/G2Qgx8feJrUbxA6bx62kn0ucnXY/ZW
         bZnKp8KkD0sqSfMTlM/F312VklT8Htz6nHhwLk8JxaSNzBmaC1ah4PZ+9cQWUm3v9J/x
         wZZQ==
X-Gm-Message-State: AOJu0YxH9ET4yTnsHcRdVGiHH0Sq4JmL/oL9dZK7KtBQZrGvv93okDGu
	h6Y2B77tednPkVyYT3x/wrvD8eFBYBI1sovpKccSxlAGK0AeO/me9QatKsGhVit7dvsX2po/abh
	QL4f88Blk1BNY9zFxMHprJK/gWWS4iloQRB9O
X-Gm-Gg: ATEYQzxP417pHJsAQVDk94YiVZa6DRHO8bmtg+Hf+7bO77BC7uI5t7O+yz6YqhDlBvP
	V/oW9ucyd3s3Kx4L7aT24Zc9XmYMaRBlZp72eZqLbeNrhKVE4x8Q0hWYQ8f8FiqbTIylxv+wTrX
	b1WLzeBJo0JuX/cqUdy7/fp/HiwUSBv0F1kKCzLYLUuBVa6JM++dcVZZ4L47ajvq5UeMKqev7cb
	nFCHqLeUKjpTnF/02MH1+aDysWIGWfbtLUuxUt/Pqcvs2rfe6V9jyl9cm/7vrkn02nUDk7u2VjL
	MPHFMQmnZx0sU1ES8OLnWyaSLIaadHxY7lAMSP/Ga1pTkGvFhGnO80idh0GTboWdJFNtf4v9UTr
	4X49bEZdpYjSGHQ2DQbUkyBAiKbXhOX9Z3AYi4pt1UDNQ
X-Received: by 2002:a17:90b:43:b0:359:974a:3d65 with SMTP id 98e67ed59e1d1-359be344e02mr881503a91.16.1772773725780;
        Thu, 05 Mar 2026 21:08:45 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-359c0040592sm41333a91.2.2026.03.05.21.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 21:08:45 -0800 (PST)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH] leds: triggers: autoload default trigger module based on name
Date: Thu,  5 Mar 2026 23:08:41 -0600
Message-ID: <20260306050841.2709175-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dennis Gilmore <dennis@ausil.us>

we attempt to autoload the module if it is defined in the dtb as the
default trigger. however none of the modules provide an alias of
"ledtrig:<default trigger>" change the : to a - so that the module is
picked up by its existing name. For example: ledtrig-heartbeat loads
while "ledtrig:heartbeat" is not found.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 drivers/leds/led-triggers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b1223218bda1..b88da1c27548 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -309,7 +309,7 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	 * Once loaded it will re-probe with all led_cdev's.
 	 */
 	if (!found)
-		request_module_nowait("ledtrig:%s", led_cdev->default_trigger);
+		request_module_nowait("ledtrig-%s", led_cdev->default_trigger);
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
-- 
2.53.0

