Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9EA42B33E;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837132; cv=none; b=mKkUrvaGc4257vQLidHrc9j9+UsRCNe3U8g2lBTwgm2167h3OjD73cApM0vpEKHNbID/VSJpWPJb91p1B2RHXIiUVqWXBy0iIeYkZWTXZvLDm+sI14oxOOl6LFlHjFf02OzYF7grui2jyMpevEoR3fVEKGoSyjit95LIFh17zZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837132; c=relaxed/simple;
	bh=c5TgvYHlCG/5HXgw3upxjyKPJm1u16eSX2A0Z4qb/y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATrIpl88QT6CiNNTwYnrisDNelRbyqwEKFu9S9iC7hxHDJXOdNNIJmOOAalgsSzQ5IzMsUGxj5JM0EmLiTh94XwoVq9kxCNgsT56AtBE6S1QIaik7aEUVO63YynFbZJxKjAnmBaBrDPVPCSYq5ZCPgYtT44CWvMtfTeRyxUauXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qb13nQ6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qb13nQ6J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35E32C4AF14;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790837132;
	bh=c5TgvYHlCG/5HXgw3upxjyKPJm1u16eSX2A0Z4qb/y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qb13nQ6JVrn2zQMlzB64EX7swow0dQKWsXqi1gJSmIHNQSiWn//T2iiugbM05e05t
	 0d+IGSGkjhhfJPZfC2Bt8lmtbVGtAcETcJISdHKTSN825nIOia9pedgDqteALVWxmH
	 9UYc+Hg7GzIVs6jV5GNipD0pk1X8wxeRaUxP5l3sEONiYr1V1UNgohhMtUdgGA3vWb
	 L4B5eNKVjGNSkUmKamtkXIwvAV1KJUhBJ6ShzaSq+kNkMSmop886+JPepUMKlWDPrL
	 VLyXpBwmrfAlB26LDmrz/CmkD1Uyj7/XYDrddPu8I07Jiwji/SZb2E3VR0DoR1DNHG
	 BFHma3XssseGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F35FCA5FCE;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
From: Wayne Ho via B4 Relay <devnull+wayneho219.gmail.com@kernel.org>
Date: Thu, 01 Oct 2026 14:45:12 +0800
Subject: [PATCH 2/2] Documentation: ABI: leds: document timer, heartbeat
 and activity attributes
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-docs-leds-abi-trigger-attrs-v1-2-54f0529bf0f6@gmail.com>
References: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
In-Reply-To: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790837130; l=5409;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=XUkqfCwSdokMBSaYM8CnAm/LMcz5dJg/PFsQuhlJmYg=;
 b=dpBLf5qqQwK8XX8Dupz35Es0QJkYVCaTXEwYyZx+1d0oSrpe0DivDube/pA60bLfFvqcCH7lV
 cCYz96CgTKiDMch79uOaGor96lfoLsWuWlSrrJN4/DG4vp1dUDdZf0R
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=
X-Endpoint-Received: by B4 Relay for wayneho219@gmail.com/20261001 with
 auth_id=1093
X-Original-From: Wayne Ho <wayneho219@gmail.com>
Reply-To: wayneho219@gmail.com

From: Wayne Ho <wayneho219@gmail.com>

The delay_on and delay_off attributes created by the timer trigger and
the invert attribute created by the heartbeat and activity triggers
are not documented. They share their sysfs paths with the oneshot
trigger attributes, so adding a separate entry per trigger would make
get_abi.py warn about the same path being defined more than once.

Move the delay_on, delay_off and invert entries from
sysfs-class-led-trigger-oneshot to sysfs-class-led and describe the
behaviour of each trigger that creates them.

Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led          | 68 ++++++++++++++++++++++
 .../ABI/testing/sysfs-class-led-trigger-oneshot    | 29 ---------
 2 files changed, 68 insertions(+), 29 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index c72cb1e0..f438fb83 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -86,3 +86,71 @@ Description:
 		Invert the LED on/off state. This parameter is specific to
 		the backlight trigger. It is useful when driving a LED which
 		is intended to indicate a device in a standby like state.
+
+What:		/sys/class/leds/<led>/delay_on
+Date:		March 2006
+KernelVersion:	2.6.17
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This attribute is only present when the LED's trigger is
+		set to "timer" or "oneshot".
+
+		For the "timer" trigger, specifies for how many milliseconds
+		the LED has to stay on in each cycle of a repeating on/off
+		blink. Writing a new value restarts the blink immediately.
+		Defaults to 500 ms.
+
+		For the "oneshot" trigger, specifies for how many
+		milliseconds the LED has to stay at LED_FULL brightness
+		after it has been armed. Defaults to 100 ms.
+
+What:		/sys/class/leds/<led>/delay_off
+Date:		March 2006
+KernelVersion:	2.6.17
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This attribute is only present when the LED's trigger is
+		set to "timer" or "oneshot".
+
+		For the "timer" trigger, specifies for how many milliseconds
+		the LED has to stay off in each cycle of a repeating on/off
+		blink. Writing a new value restarts the blink immediately.
+		Defaults to 500 ms; together with the default delay_on this
+		gives a 1 Hz blink.
+
+		For the "oneshot" trigger, specifies for how many
+		milliseconds the LED has to stay at LED_OFF brightness
+		after it has been armed. Defaults to 100 ms.
+
+What:		/sys/class/leds/<led>/invert
+Date:		Jun 2012
+KernelVersion:	3.6
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This attribute is only present when the LED's trigger is
+		set to "oneshot", "heartbeat" or "activity". Any non-zero
+		value written is stored as 1, so reading it back returns
+		0 or 1.
+
+		For the "oneshot" trigger, reverses the blink logic. If set
+		to 0 (default) blink on for delay_on ms, then blink off for
+		delay_off ms, leaving the LED normally off. If set to 1,
+		blink off for delay_off ms, then blink on for delay_on ms,
+		leaving the LED normally on. Setting this value also
+		immediately changes the LED state.
+
+		For the "heartbeat" trigger, inverts the heartbeat pattern.
+		If set to 0 (default) the LED stays off most of the time and
+		blinks briefly on. If set to 1 the LED stays on most of the
+		time and blinks briefly off. Unlike "oneshot", the new value
+		only takes effect at the next phase of the pattern.
+
+		For the "activity" trigger, inverts the on/off states of the
+		CPU activity blink. If set to 0 (default) the LED is mostly
+		off when the system is idle and stays on longer as CPU usage
+		grows. If set to 1 the LED is mostly on when idle and stays
+		off longer as CPU usage grows. The new value only takes
+		effect at the next on/off transition.
+
+		This is unrelated to the /sys/class/leds/<led>/inverted
+		attribute, which is specific to the backlight trigger.
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot b/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
index 378a3a4d..3532f13d 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
@@ -1,32 +1,3 @@
-What:		/sys/class/leds/<led>/delay_on
-Date:		Jun 2012
-KernelVersion:	3.6
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Specifies for how many milliseconds the LED has to stay at
-		LED_FULL brightness after it has been armed.
-		Defaults to 100 ms.
-
-What:		/sys/class/leds/<led>/delay_off
-Date:		Jun 2012
-KernelVersion:	3.6
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Specifies for how many milliseconds the LED has to stay at
-		LED_OFF brightness after it has been armed.
-		Defaults to 100 ms.
-
-What:		/sys/class/leds/<led>/invert
-Date:		Jun 2012
-KernelVersion:	3.6
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Reverse the blink logic. If set to 0 (default) blink on for
-		delay_on ms, then blink off for delay_off ms, leaving the LED
-		normally off. If set to 1, blink off for delay_off ms, then
-		blink on for delay_on ms, leaving the LED normally on.
-		Setting this value also immediately changes the LED state.
-
 What:		/sys/class/leds/<led>/shot
 Date:		Jun 2012
 KernelVersion:	3.6

-- 
Git-155)


