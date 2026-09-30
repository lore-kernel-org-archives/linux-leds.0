Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0075404BF6;
	Wed, 30 Sep 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751254; cv=none; b=k3wouI5DWnsrX9gJW/hApOcrYPer1+rykMe6Y7PZiKWRuH8hLaL5trSFTg5eSjFIlvr9YFtKtHli862cSN4CqOaEZR3dWFPLR9tl28C3uXM6PxJWqSwW5p6qswbaw+0der2G8/ZWSkxyfCXdBFciV9CrYWGD67W0P/NapSoGxeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751254; c=relaxed/simple;
	bh=lK5+j3uPBCngGxgIf4uR4HYLN2ER5vovCEytpg+tbyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FBkdAlMgSvEvzGejbTveOr9hiSR/E5ESXPn3iKUa0cEhJ8pUi6ky07lATsfkeTYvMcg5HWA30Ex+2M/EHRkkvRlG4nQEGg1szpyM8bIQ+6QZD96tLVGJLsyFMe0W3CIrIpUCKnatLhPi7TwcB3XbKpDbmTQ6io3AcjEgCGe9a5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUcg1uNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUcg1uNy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E36A7C2BCF4;
	Wed, 30 Sep 2026 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790751254;
	bh=lK5+j3uPBCngGxgIf4uR4HYLN2ER5vovCEytpg+tbyU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PUcg1uNy+4Oa3bfbk2pKkPPtvhR2Dba+jb27bbeIHF8026JaYkBPMl24DYhpKPixe
	 qTBxxF3OxpELhLAxLoZjx9O9u0fLZIcCfeSg1KshtL4/Ed6XNNrmFrHLfi7yQI78Xy
	 wkdiRZQ0EUdlF2ZGHopO+Jsf/Pp2h3NbmaMgbVGjeL7j3Q2N1BsB0w9q3mh5l7h0F5
	 6PwXBpOANxXr9AqqPXF34rk8CeaAQHoIuSdrjsxjTQcoAEEFV/3p+j8cbOnqIsc2zt
	 YJnuYyVWimazi1k9wXdSktfQz75l/5rFwSc7NOGopard4mf9HdwMBj90RxWzk3/qok
	 KlHf7Oc9/kUhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96FACA5FB5;
	Wed, 30 Sep 2026 06:54:13 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] leds: trigger: input-events: Restore previous
 brightness on input
Date: Wed, 30 Sep 2026 14:54:09 +0800
Message-Id: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQWTsGCoKw8h6GRYEBJoGWdGqjI
 dzdyglcfm/xvx2EHJNAk+zgKLCwNRHqkkA/azMR8hANKlVlWqsCFxoE2WwvjxTIeMHO8TR7QyK
 oq1JTrauqu98gJjZHI7/P/LONnlm8dZ/zLWS/9c9wyDDDLu1pHHOt8iJ/TKvm5drbFdrjOL5aX
 lTOyAAAAA==
X-Change-ID: 20260924-leds-input-events-brightness-a76ae9a77b85
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751252; l=1998;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=lK5+j3uPBCngGxgIf4uR4HYLN2ER5vovCEytpg+tbyU=;
 b=Pq5O8BlHYjOzvUYYkAC06Aiq5O9fOZpE2qcgdK/ssogHMpyJ8XHHMkoSCqDaUIhoqUV3Iz1Op
 jp/t3zHA2dhBqRI+jj+hX2ffXr64CRmr2UCd8Fd0PVhKK+vjXBGLd7j
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com

The input-events trigger turns LEDs back on with LED_FULL, so a keyboard
backlight with several levels always comes back at maximum after being
idle. This series restores the level the user picked instead.

Patch 1 adds led_trigger_walk_leds() to the LED core, so that a
trigger which needs a different brightness per LED does not have to walk
trig->led_cdevs itself. Patch 2 converts the input-events trigger to a
regular trigger with per-LED state in trigger_data and uses the helper.

This came up while looking at a keyboard backlight idle timeout for ASUS
laptops in asusctl:
https://github.com/OpenGamingCollective/asusctl/issues/98

Tested on an ASUS ROG Flow X13 GV302XV (asus::kbd_backlight, 3 levels)
with the trigger built out of tree against Fedora's 7.2.7 kernel and a
local copy of the helper, since the helper itself lives in the built-in
LED core.

---
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
      leds: triggers: Add led_trigger_walk_leds()
      leds: trigger: input-events: Restore previous brightness on input

 drivers/leds/led-triggers.c                 | 25 ++++++++++
 drivers/leds/trigger/ledtrig-input-events.c | 74 ++++++++++++++++++++++++++---
 include/linux/leds.h                        |  7 +++
 3 files changed, 100 insertions(+), 6 deletions(-)
---
base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
change-id: 20260924-leds-input-events-brightness-a76ae9a77b85

Best regards,
-- 
Nikolay Plastinin <plaztininikolai@gmail.com>


