Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368296;
	b=rB41ucZL5CndljW2g2sF9Y1ocBkhHe43zpESYajvMmQZBTkKpu6gaVLF2UCMu6RNxA7Y
	 Zoc7XeOKN7nvq0us6W2ZzmF2Ig+2TEZq33QmhW1Q+DBfuNBMdoY+OyDFNLH8RVZZn74fA
	 RZXHaxVtCZWvkv4NS+lv98uxjJnMCoTXqoetlbGMG2nxz5WQfmDBBnxMoNZk0/JQ9MSkr
	 O1MjjlQUvdhitXni0LHXd4dkOSA/GAYlz9pUhQc3iUAOVH4Zm7qC2lse5Swkfs/7EhnVl
	 8YqtgAT0swcA14LWr0/MYY5UjTmWwj0YGlO4xDOidhlDLABe4eE3ZxsYYZ1Yn5hGG9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368296;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=pnK8oBK/BP/5LlJyigwP8TEeAwBVqyULylx6DQ3SWrw=;
	b=ONvHe26SbZ+jvhvifvcPMlQqrQn33Ylbq9Gzx4TglAVQvxzDRcNCsot/fbj5NBTmMU4a
	 1laJZLAUDXuxr8sv65QqaKP4j5GT0HYfOcMjLZ54Zwh9iGMpvl566vdQhLgQRegRpRj6s
	 9kxCo3o82CK8nvUrt7+/CDJkVEDOlKwHB1BIbf4HMO8jI1zv3wy1sczNGC5AreEpy3L61
	 Ixw5O2vy7H0V1IoOjIkryLwuHsl8wfopc5W2LqNCAolZoQnbeuehkFWRTWaKLTHetKI0d
	 rFX2RP2gsJCUfpJX31hJT244+2JxbsOCC/zuVXHg99dAg+3gFc10Atn+07m+Za916Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAH+Rm7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D579606A322;
	Fri, 30 Oct 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAH+Rm7d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793368296;
	b=HkCJIRxyleGL2dNStCwjQ5F7GLLm0dq4ygiMuMenfhsywC8WAxu5QP+mZKMngPq0Iahv
	 KBBERLI4zmVHARR/cTh/BlkeGkeb6fN3hR4Hkcqe8PAB5Uj8VTvYad6SKpOJd7HUrn+Zq
	 EvTFGXPums/n90hAbuMdp3ll+MbJ4Ir1iqTj52dHsa4e4K3Gb9uiUwUheqFZlzCFqypCr
	 X6CbKucMLuMV//MVzAd2twOomeszhwurWfyQ/JfPFydVpYcujqHrWy7FdReOUBDvj6fI3
	 6SYcc+HXPNSAHPMC5cJqgNXiEHbkn1rel/V6pLuvjL4odToElAW7p1lry7KlVl7YhRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368296;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=pnK8oBK/BP/5LlJyigwP8TEeAwBVqyULylx6DQ3SWrw=;
	b=YZq3/5Wa+bcKWfs12k2dXKBctIsNi4YR5EqtMNSg8pNcvVFb8bWEzMD2JFkuJOSohbCO
	 rBymaWOarGbVqJtx9q2uZH3rSoShivQ2MtyaegVrPYXxlc/UN1vxQkBCRzW1CY3ROEpoy
	 EYPcEaJoMDiUSVcID3qdroUKvVd8KrBQXqRmFOLL1LiSfMKTR2Qtc8DYKueHLJ2wpkQYf
	 6K9Y4FZ7ddk4E//Gcb+KMnp46dO3G0UIZV+9bT+7aexNJ3I9uMuYWe/oHfxQyh42Zi13U
	 FRb0Na10WuE0hbOR1KzE/tM1dbkd1AiGCOCVpsqTBy2FLX9aqz216fjNrTjjkdS052A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 055FF1F000C1;
	Fri, 30 Oct 2026 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368295;
	bh=pnK8oBK/BP/5LlJyigwP8TEeAwBVqyULylx6DQ3SWrw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=eAH+Rm7dD2Q4MBBxg6mrUJSEp+k/Tt8TE4SrbnuCuNJaudbfA2uqk6zXxTXqSqb0+
	 Xb5IeIsnq88NXp2JH0A+bmEhdUvll5YN+okZpZh3dn55VLqxwE3tDh6gK6mUdZjfLs
	 n1sRAwh5iZnINwrwQS2VdS56IuzK/nQ6AyKx/olP9z7DLhvWi3BfeGlSlJrWmJjqdL
	 AIs0IUBfAtGOeKI640x8xXOGgSlwiFto57/9GtM53eN47XxbN/VcJduh8DcvVoudBf
	 nvkjKcfvKZjEJODazFPl7s6uYFQwCj6vaSkxz74yx4HCM3YVqYEAIbqURyp/yEcfF3
	 CwfHcy2Vyuxyw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A1A7437DF;
	Fri, 30 Oct 2026 13:51:34 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] leds: trigger: input-events: Restore previous
 brightness on input
Date: Fri, 30 Oct 2026 21:51:30 +0800
Message-Id: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Nu47CMBCF4VdBrhlkj00uVLzHagvHniQjgRPZW
 WsRyrtjKBASBZT/Kb5zFYkiUxKHzVVEypx4CiXMdiPcaMNAwL60QImVbNHAiXwCDvPfApQpLAm
 6yMO4BEoJbF1Zam1dd81eFGKO1PP/g//5LT1yWqZ4ebxldV+/hLMCBZ101Pfaojb6OJwtn3ZuO
 os7nPEF0/IDhiBBt6bx2nnvmzdMPzElVfUB0wVDZyp0tieJ8hVb1/UGcwEvD2IBAAA=
X-Change-ID: 20260924-leds-input-events-brightness-a76ae9a77b85
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793368292; l=3666;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=TqfNC0LMUz3nz/opoj1+J7OcrmSpnFYU8zd02dPuZfo=;
 b=L3LbvudhFfLquOXHsn845Su6kFcFrxuQCzBgVsheOXwjGRXtmYd/SRGpeX/inSfaRveFKZyG5
 8ts/vXyEKtvDyR9TV/Kptezr5pTv4qxa44UFRoVfowNtqrHDc7ZtXjh
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com

The input-events trigger turns LEDs back on with LED_FULL, so a keyboard
backlight with several levels always comes back at maximum after being
idle. This series restores the level the user picked instead.

Patch 1 adds led_trigger_for_each_led(), an RCU list iterator in leds.h.
Patch 2 uses it to save and restore each LED's brightness in one loop,
with per-LED state allocated in activate() and freed in deactivate().
There is no new exported function or callback API.

This came up while looking at a keyboard backlight idle timeout for ASUS
laptops in asusctl:
https://github.com/OpenGamingCollective/asusctl/issues/98

Validation for v4: the module builds out of tree with W=1 against Fedora
7.2.12-200.fc44.x86_64 using the patched leds.h. A user-space harness using
the driver functions reproduces a heap-use-after-free with v3 when the
LED remains in the iteration after deactivate(), modelling the
attribute-creation error path. With v4, the same test, brightness restore,
and 10,000 concurrent deactivate/reinitialise cycles pass ASan/UBSan.
The harness substitutes mutexes and a one-element list for kernel
primitives; it is not kernel fault injection or an RCU implementation test.

V4 was tested on an ASUS ROG Flow X13 GV302XV with kernel
7.2.12-200.fc44.x86_64 and no external monitor: brightness levels 1 and 2
were restored after idle timeout and keyboard input, and 20 trigger
activate/deactivate cycles passed. No kernel messages appeared during
the test. The original brightness and trigger were restored afterwards.
No full kernel build has been performed.

LLM assistance was used for the implementation, tests and message drafts.

---
Changes in v4:
- Clear trigger_data under input_events_data.lock before freeing per-LED
  state in deactivate(), as suggested by Lee Jones. This also covers the
  device_add_groups() error path, which deactivates before list removal.
- Update the NULL-state comment to cover activation error unwind.
- Patch 1 is unchanged.
- Link to v3: https://lore.kernel.org/r/20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com

Changes in v3:
- Replace led_trigger_walk_leds() with led_trigger_for_each_led(), an
  RCU list iterator in include/linux/leds.h, as suggested by Lee Jones.
- Remove the exported helper, callback typedef, and void-pointer argument.
- Keep saving and restoring brightness in input_events_set_leds(), using
  guard(rcu)() and a single loop for both the on and off paths.
- Link to v2: https://lore.kernel.org/r/20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com

Changes in v2:
- Keep the saved brightness in a per-LED struct allocated in activate()
  and freed in deactivate(), stored in led_cdev->trigger_data, instead of
  overloading blink_brightness (Lee Jones).
- Add led_trigger_walk_leds() to led-triggers.c and use it instead of
  walking led_cdevs/trig_list from the trigger (Lee Jones).
- Use the Assisted-by tag format from coding-assistants.rst.
- Link to v1: https://lore.kernel.org/r/20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com

---
Nikolay Plastinin (2):
      leds: triggers: Add led_trigger_for_each_led()
      leds: trigger: input-events: Restore previous brightness on input

 drivers/leds/trigger/ledtrig-input-events.c | 76 ++++++++++++++++++++++++++---
 include/linux/leds.h                        | 12 +++++
 2 files changed, 82 insertions(+), 6 deletions(-)
---
base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
change-id: 20260924-leds-input-events-brightness-a76ae9a77b85

Best regards,
-- 
Nikolay Plastinin <plaztininikolai@gmail.com>


