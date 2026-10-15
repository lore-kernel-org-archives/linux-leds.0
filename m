Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9473572675;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090612; cv=none; b=lLAiCPPgW8hEo4+Zf6tBu+1T+ENJwkrpEPo2uDjwjs2L2F9hx7bY67CdeHgZ2Evv119L8ANWOQxsuP/KyR8RvHEea/7/aNIyQXpjqEAlWDI0c6FyAZhazzXGLR+YfaHZ5YXnCOOe6m9CwVcq4swwvx+C7vekIUd2UPWvlP6O9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090612; c=relaxed/simple;
	bh=1NQFXQy9NKOiM7FADs3pvz5L9QzecnjgPohJ0Yn0gV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HVRUj/vgzqwU65zjTolljeFtq5eqHEVxaJPQMR5QxrRuepcUUzATVZ8Dji2uN7GW6OAu4F6ruyzjbCZExMYfL/I1Wtvo7vQa04vShxBbgp+ljyQe6qUjVhx0i/7cK476/A5c1yTaKDcL6OPnF9RtTJbv7nCYpWOWqKyi5af9Nx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svQFNY56; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svQFNY56"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34255C2BCC7;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792090612;
	bh=1NQFXQy9NKOiM7FADs3pvz5L9QzecnjgPohJ0Yn0gV0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=svQFNY56wES4pR9WtZ+zmekb5yHf9/E28Ho/1FFVLLk1chVI2xSpbW07h/1HZ1yAw
	 w66rZw34XI3qYAIp1zG0q3Nq4BTtxPL94F4ZkWkZNNQj8btYQmhRKjDUcC6Vqrra5n
	 E+XlrHLcLyJF4VIdeEwMZm57AOqSGll93yHOxRwQB1yBOn0piU3aqTD9KNRyRRTD67
	 UpaBqY5h12ErngMEg19Urh+MODv6EUQh6rtjeeDhOFc01GaFJeFfVOTsXBemyp2ort
	 OlzP2FIF4UmTtZLP4RTIfABq+3KyWxfl3eCl9QOwnKIc0101ZGdj8bnPTIRDYvcrM7
	 tNc1M8owmQcdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F796CCA464;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] leds: trigger: input-events: Restore previous
 brightness on input
Date: Fri, 16 Oct 2026 02:56:48 +0800
Message-Id: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NvQ6CMBSG4VshnT2mtMiPk/dhHEp7gJNgIW1tN
 IR7tzDppOP7Dc+3MI+O0LNztjCHkTxNNoU8ZEwPyvYIZFIzwUXJG1HAiMYD2fkRACPa4KF11A/
 BovegqlJho6qqrU8sEbPDjp47f72lHsiHyb32t5hv659wzCGHlmvsOqmELOSlvysaj3q6sw2O4
 gOT/AcmgINsitpIbYypv7B1Xd806sqvFQEAAA==
X-Change-ID: 20260924-leds-input-events-brightness-a76ae9a77b85
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792090610; l=2781;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=1NQFXQy9NKOiM7FADs3pvz5L9QzecnjgPohJ0Yn0gV0=;
 b=EM7JP7tSgOEg4+OwkXUu/gVvvTiezSY9aJEr/Ik8o3hvupC30nK65Bb47KVCgxCpXVtQ0wyOm
 CnTNRyBg4JmCiol3WIxCSx6woo+QAtT2Odt19o+IXalY462Hf3PNkdE
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

Tested on an ASUS ROG Flow X13 GV302XV (asus::kbd_backlight, 3 levels).
The trigger was built out of tree against Fedora 7.2.9-200.fc44.x86_64
with the modified leds.h and W=1. Brightness levels 1 and 2 were restored
after idle timeout and keyboard input. Twenty activate/deactivate cycles
completed, and no kernel messages appeared during the test. This was
not a full kernel build or a leak test.

LLM assistance was used to implement the review changes, prepare the
hardware test script, and draft the commit messages and this letter.
The hardware test was run locally by the submitter.

---
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

 drivers/leds/trigger/ledtrig-input-events.c | 70 ++++++++++++++++++++++++++---
 include/linux/leds.h                        | 12 +++++
 2 files changed, 76 insertions(+), 6 deletions(-)
---
base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
change-id: 20260924-leds-input-events-brightness-a76ae9a77b85

Best regards,
-- 
Nikolay Plastinin <plaztininikolai@gmail.com>


