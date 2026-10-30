Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368296;
	b=RxJwsPor0+scwo1EmaYf7QF+L6Wfk0/73o8UKa7CvmYcIrp76eycdo4+cVn7sAFRMPnT
	 w6eF16JXLa8On5IZqDFZDRkjhZwwLtqmuXpSoScAGSwZgbjMMrwSccGO2Bmxl2hk9TFNs
	 Uhe5s9TuXv0cFN1xhmmke4ZF6ealYUHpycaahiDlvIqIoMZTYcul9XX69Cp4G8yKgTGu4
	 oni2s4mCIAyo8saKdD3nIxYMvL6BwC5M1od9OnY3GZJPIk2CnT4SxeXq+iaxRPRX9gmTF
	 5//kkNE2DWy0MDfE8NE7gkZlxUvTvuIdLoZl4WVBsrIPtAnjmnfB+LNQLn1083D3s9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368296;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QC7KH5x12nwdmuVQXnwKWI7lssciMQMvDzSXso4Lr2k=;
	b=sHdtbUMT4fvA7OYQSGL1ciiLDOPZ1zohSaTfAd5j1kEqJWPjceNon7t5+sisVHzQ+2UI
	 5rr5OgyNYv9eYh+etGrT6AtxdOiRjgQKmv8EHhnFCR+OFMEPd4vmSZ8jrFzXOCqIS75CR
	 2zqnj7hN1+NaJlqnWlQcflPAaC2qX/rCvoaGzIbV8OKkK2nJz+DtaEquKZI/OY9gq/Kmq
	 mtY4ZOLjfm4uaZiTCLbQ9ueaNzhMD6BgPQPj7yGsRDdbXjmPL9Aea+bXZoCWw78tZbCUA
	 oWQ2h5tguwPxweRBJURCK49xwfn2yHYX2D4z7244Rusn1IzD9madBvHQFX4eYbdB2pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXVgLNbY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C87606A330;
	Fri, 30 Oct 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXVgLNbY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793368295;
	b=qAnMjcVF+5OdqoDVqCTiPLPSwy1DKC0HKLSKXmJuBxSttUI/nMh0585QE2S1xnstANf5
	 GYyomtm+avPR++7DLWlarZGABHisrMJy2LkpLssxU2isiU5YhNrDDx7C/UJfDKaYYBunQ
	 ckdDw1T6XURc3/0m+nWsrTdeHyzYeTYCKUzPoUbOzHJpX6yiwT8/8j4wt7dcRUsf5cw4O
	 PEe8zKvtytFinJJrbaz5vuyrKJlVGReXmcg0EyZ5FAdaAfoIIKHMQ08/m63BXrlaACGdc
	 MVS4b7oAdjD9T1y8dwizCa/pG0+NNvnPxN5GYyQ6PjpH62cpaUt4UY9F7S/7Yv2629Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368295;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QC7KH5x12nwdmuVQXnwKWI7lssciMQMvDzSXso4Lr2k=;
	b=HDpMH73sFbAyktHbBLszfGe3T6H+l/mFFb4uzYh2W/Y2nmq+bow0D0IMhirbPOwGsAPf
	 +Lpj2ydvQ5XQJoq54yES+4BNxZn9PdiD2lAQbBkmROvY2fqZpu4bORMhQK8XB7AqQ4Nm6
	 a09WzMHgCG+izWp7RWCWg8DqbxrxlAwjw+nP3/caiP3Q3wTZJ4j7R9BRErucdevIr/Spq
	 ZjZY7yAcR73Xd2vGDxNa9LKi4RqIyFIhSW0HcnNzUS78Baqmd53+3UDyqf2qtu/9MKmGK
	 3x6bN4uYzNePbEpAlHEHR6rA1GbYYEq6E4aCcn/cAtktf8CS6Rslp2SZi7UARM5kzUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 056131F0093A;
	Fri, 30 Oct 2026 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368295;
	bh=QC7KH5x12nwdmuVQXnwKWI7lssciMQMvDzSXso4Lr2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IXVgLNbY9aOWd1MtUNGmgJUJDLHtb7Zyl9ctri6S9r9FIZe9A3QkkCT39i3+1FTTi
	 1Ht/SxvF+LC1fFSooGw31bK7zsP/X5YOlLyxE7yYJzfMH2zv5BU0+rs1wTCaRXfXWJ
	 pYonO2bWcb7Z15viix4BKK8V2HwmuX3eonkRnNdglYzqsdNwdRyLFuN8N2EgAJQgaH
	 hyXjr9hfF3ly62m+G/fvLd9pBNqWxLi9cv4+pOYSCwFin+KpodPXItqO1D55Gq8BvG
	 3wM29kv2ZP4kj2a5eAZwXzp7KemcVnOS3SUyTtaIV7NWsjJVL4rbbh2KxrDaATlJB8
	 v3JiwwYNx5xaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 66979437CF;
	Fri, 30 Oct 2026 13:51:34 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Fri, 30 Oct 2026 21:51:31 +0800
Subject: [PATCH v4 1/2] leds: triggers: Add led_trigger_for_each_led()
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-leds-input-events-brightness-v4-1-5ea0ead7480c@gmail.com>
References: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
In-Reply-To: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793368292; l=1697;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=XB1M/17vbfVXqMrEZDyY+zPssA2UXsnOCNxpwiGlg0U=;
 b=FR34tIg3//iHwMs2rey0Ta4U8G7CGbCRx2PqsqZ++LBMVS81BF8v31+B9S8Z6yiuUYeejSgxm
 C2XRvwdiyFnDGwMa5YJKvI2b6FcwYFTbnwxqM4R2zpYJTfU9oa6WQ/w
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com
Content-Transfer-Encoding: 7bit

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


