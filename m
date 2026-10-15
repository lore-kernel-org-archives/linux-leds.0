Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B9572668;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090612; cv=none; b=r+p43H5kNo7ldFtQ8v6MTiNS+HVuAMyUA7MJp3S1bu4O0p1tR4ccVo33Oi6qvqsZm909rs/iaSuf6inF+KW67X7V1bbcGrqfVRU251UQEAlJpq3udEXmUjlTaQZodVgLz/rEJ/XcNzk1O2MkrDlRbVKOQXLOSuSWR7RmmzGnTwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090612; c=relaxed/simple;
	bh=n05Pbba4Xpt7Ey81EOVXMb+ALcpuVJ9xzrHGeZiU1YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=co/K66+M/LuKSZw+BoMtRHHMSqLzFBdoMUZoO8jPkEJ2SMNod/UsVoSC4JUQjvbCJiFB5+PPcCAUSvb2/oaNs/MUrxU89nnzvkOLez3++ywSmQEzXCTLJSLTJdawMj3zhjR5SkhiiRVAviMTkovhRKxIEudQj0oQslXaKxHoVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKwGDe8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKwGDe8u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41BDFC2BCF4;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792090612;
	bh=n05Pbba4Xpt7Ey81EOVXMb+ALcpuVJ9xzrHGeZiU1YE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PKwGDe8u6Sxge9NQnOBQD3FZ28cEeNiYgFeABBIHMjkrpdLxQIsk1gQ4xKEo1G8IY
	 6GG73x2a9+mVk/eYdgKw1qoyjda2TEV3qEerRuQohaV+lAfQjem+0TnZI8nOsKzwJm
	 15MBc483z2FziMyFpvjQCk/mWvBa6pZC+ythpcPMpIKuqzvEE1KVxILq/o8mkfzf8v
	 DWhSHaRJ0riULPIfJ1XGgfk0wYcrjGKjIWMMyWC129ptBNNAFn/f7UTf4ldh6dimh9
	 9CA73srCVSZFqW5CTpXIq03OWiVXuS6DrDfSNslomnuHtMIYFloKaghRH+i9J5umvV
	 fyT7P5ULZhrug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0EECCA467;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 02:56:49 +0800
Subject: [PATCH v3 1/2] leds: triggers: Add led_trigger_for_each_led()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-leds-input-events-brightness-v3-1-2c462cafe020@gmail.com>
References: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
In-Reply-To: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792090610; l=1697;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=XB1M/17vbfVXqMrEZDyY+zPssA2UXsnOCNxpwiGlg0U=;
 b=eDbZX3Z5sFT4M5rdzV+XaimOpxy7iGL9NtUg4YPuhcqOrF9k9/BDeynLETlfn61wHRpTUfCT/
 czA/abO5EY6Dt64dBye/z1xdPP1gomZ+Ux3wv+u41SZs5in4ZZ8hr6W
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com

From: Nikolay Plastinin <plaztininikolai@gmail.com>

led_trigger_event() sets one brightness for all LEDs using a trigger.
A trigger which restores a different brightness per LED needs to iterate
over the attached LEDs instead.

Add led_trigger_for_each_led(), a wrapper around list_for_each_entry_rcu(),
so triggers can perform this iteration without spelling out the list
members. Document that callers must hold the RCU read lock throughout
the iteration and must not sleep while accessing the LEDs.

Assisted-by: LLM
Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
---
 include/linux/leds.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index a515f075c..675c58661 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
+#include <linux/rculist.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -502,6 +503,17 @@ struct led_trigger {
 	const struct attribute_group **groups;
 };
 
+/**
+ * led_trigger_for_each_led - iterate over the LEDs attached to a trigger
+ * @pos: struct led_classdev pointer used as the loop cursor
+ * @trig: trigger whose LEDs are iterated
+ *
+ * The caller must hold the RCU read lock throughout the iteration and must
+ * not sleep while accessing the LEDs.
+ */
+#define led_trigger_for_each_led(pos, trig) \
+	list_for_each_entry_rcu(pos, &(trig)->led_cdevs, trig_list)
+
 /*
  * Currently the attributes in struct led_trigger::groups are added directly to
  * the LED device. As this might change in the future, the following

-- 
2.56.0


