Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365D28D831;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267089; cv=none; b=X3ySJxTjgML/zZQYNAVt6Tp+w33vCi983Fxx1OdLviJ7UmP08zmOgBiBwBFtLWDoMggwbGVSKh0hYFBceBN2iiKBx0ZGg/B4+uhpC4AuRNWZ3AyKBLEAmIni99mpFfeIcPyRQLuAD1X1rdFfxyQL8WnWB77ulVtgSY8wxRvh3xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267089; c=relaxed/simple;
	bh=ZnOgLdspKp6PXfMxtUeiK8FG0a+Ot0kQxnHtZbQFrOY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=liwuCg4NfwdiUJE3BA1ibm5sMhrtRzXqV2rPVNXOtMHlVCdeelWXevtR70PlqEFxTAOz7U/XrfjJYD5OZ5cZKDqXwbl5+MggjOwRdtFHV5LjK55oAXOtrp88UU/NmQwoAdVLHgX4wmwLEacfBgJHEF2+vg8Ea0M+bCtJYk7fMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nj0J70qJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nj0J70qJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7283FC2BCB9;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789267088;
	bh=ZnOgLdspKp6PXfMxtUeiK8FG0a+Ot0kQxnHtZbQFrOY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nj0J70qJxSnBMzMZH6IR+yNTiaFQK8q4LkiI6FESAldQJNZyE7Wpq6tle7cWjnVrA
	 zBtmmV7JAo++CG5JIrgRQtFoQePB9Bw/0hBb0c609ndxA8k/sW5yk6A6rneoyWX+LJ
	 BhKu4QCDzsWywdxbAfOBHxBugB4fkDyxrRHmpHBIRu+6zZMLTpNVR/Lj7qBYvMpy66
	 FAg79gLFbNd4vXYj/XEg70L4hIMJPqGGi18TeOgvmYUnjtUNIeAGhGwd0fPoajJZXa
	 zMzEcRyKOSIpI7mmRRCaWoQceXUGeY7zUNOHyPNBowlsbBWQCadNpM0jwW7J1onxKT
	 hVWunlH6eewnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A002C88E5A;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v7 0/3] Samsung Expressatt: Camera Flash
Date: Sat, 12 Sep 2026 19:38:07 -0700
Message-Id: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XR32rCMBQG8FcpuV4k/2NkjL3HGHKanKxh1m5NL
 Yr47ov1wq7gdvmFnN+XQ84kY58wk011Jj2OKaduX4J9qohvYP+BNIWSiWDCMMkMxeNXjznDMGw
 9tNjDNu4gN5RLzzVYJSwAKdPlVkzHSX57v+Uevw+lYLgdkvbKTAWb6nnytbAznw7dwTefeKKjo
 Jwy5YIHxaOX8PrRQtqtfNe+XLtqyEhLaNOwqUa7EuTa2KQ8dP1pWm3kU+W/W4ylh9bcOROtDzG
 Ee9NkjmLm8PVjRxRHe1E7MEIGXy8dOXPEH++RxUGrUQe9do7FpaNmjuSPHVWcyNG5qKzSXC4df
 Xc0k48dXRyntVCaGbDOLR0zc3795sIxxQnIIteMCYVq7lwulx/fCOLTmAIAAA==
X-Change-ID: 20260306-expressatt_camera_flash-13c15a7427aa
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789267087; l=5616;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ZnOgLdspKp6PXfMxtUeiK8FG0a+Ot0kQxnHtZbQFrOY=;
 b=sP4WXXThtqcRH2L60jl8kDIxLzzTTNrY+FCptx+CJiD8G2aOtAnBHF6RfWOhw52NBybIE/cj+
 VwgkWELg9tRBelLN5av60WPhv3EDEItrmLEi/qPDL102G4qrc0RXQLP
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

This small series adds camera flash to an existing similar mainline
driver and adds it to the Samsung Expressatt's DTS

// Tests

// # Navigate to LED
sudo su
cd /sys/class/leds/white:flash

// # Should stay at dim brightness
echo 1 > brightness
echo 1 > brightness
echo 1 > brightness
echo 1 > brightness
echo 0 > brightness           # LED_OFF

// # Max Brightness
echo 50 > brightness
echo 0 > brightness           # LED_OFF
echo 99 > brightness
echo 0 > brightness           # LED_OFF
echo 1000 > brightness
echo 0 > brightness           # LED_OFF
echo 100 > brightness
echo 0 > brightness           # LED_OFF

// # Should increase in brightness
for i in $(seq 1 16); do echo $i > brightness; sleep 1; done
echo 0 > brightness           # LED_OFF

// # Test flash strobe (rt8515_led_flash_strobe_set)
cat max_flash_timeout          # check max
echo 200000 > flash_timeout    # 200ms
echo 1 > flash_strobe          # strobe ON → brightness_commit + timer
cat flash_strobe               # should read 1, then 0 after timeout
sleep 1
cat flash_strobe               # should be 0 (timer fired)

// # Test manual strobe cancel
echo 1 > flash_strobe ; echo 0 > flash_strobe          # immediate off

// # Check regulator error handling
dmesg | tail -20                     # look for any "failed to turn off LED" msgs

// # Multiple strobes shouldn't cause errors
echo 200000 > flash_timeout
echo 1 > flash_strobe
echo 1 > flash_strobe
sleep 1
cat flash_strobe
dmesg | tail -20

// # Multiple strobes shouldn't cause errors (extreme test)
for i in $(seq 1 500); do echo 1 > flash_strobe; echo 0 > flash_strobe; done
dmesg | tail -20

// # Test minimal timeout (turns on briefly)
echo 1 > flash_timeout
echo 1 > flash_strobe
sleep 0.1
cat flash_strobe
dmesg | tail -20

// # Flash strobe overrides brightness and flashes at full brightness
echo 200000 > flash_timeout
echo 1 > brightness
echo 1 > flash_strobe
sleep 1
cat flash_strobe
cat brightness
dmesg | tail -20

Downstream reference:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v7:
- address Lee's comments
- PM8921_MPP_S4 instead of PM8921_GPIO_S4 for the MPP4 power-source
- Link to v6: https://lore.kernel.org/r/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com

Changes in v6:
- Address Lee Jones's comments:
    - formatting
    - use cancel_delayed_work_sync()
- Link to v5: https://lore.kernel.org/r/20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com

Changes in v5:
- Address Lee Jones's comments:
    - formatting
    - use devm_regulator_get_optional()
    - use a workqueue instead of a timer
    - previously we were validating ent-gpios xor vin-supply at probe,
        but was removed. update the commit msg to reflect this
- Link to v4: https://lore.kernel.org/r/20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com

Changes in v4:
- Driver:
    - revert function renames
    - add comment to use flash instead if torch pin not available
- Link to v3: https://lore.kernel.org/r/20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com

Changes in v3:
- DTS:
    - Renamed and reordered nodes
- Driver:
    - Use regulator_is_enabled() instead of reg_enabled
    - remove ent xor vin check
    - remove rt->reg == -ENODEV check
    - rename functions to reflect what they do and added ret's
    - Fixed: LED was increasing in brightness when setting the same
        brightness multiple times
- Link to v2: https://lore.kernel.org/r/20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com

Changes in v2:
- dt-bindings: Explain the hardware and not the driver
- **/*: Use vin-supply instead of unlock-gpio
- expressatt DTS: Reorder pinctrl-*
- expressatt DTS: Define rfs-ohms to a default (couldn't find
                  information about this)
- Link to v1: https://lore.kernel.org/r/20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linusw@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Rudraksha Gupta (3):
      dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin supply
      leds: flash: rt8515: Support single-GPIO flash ICs with vin supply
      ARM: dts: qcom: msm8960: expressatt: Add camera flash

 .../devicetree/bindings/leds/richtek,rt8515.yaml   |  34 ++++-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  44 ++++++
 drivers/leds/flash/leds-rt8515.c                   | 147 +++++++++++++++------
 3 files changed, 184 insertions(+), 41 deletions(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260306-expressatt_camera_flash-13c15a7427aa
prerequisite-message-id: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
prerequisite-patch-id: 2b24e9ba47500ef05d38e37b40d8ca2dceb4716a

Best regards,
--  
Rudraksha Gupta <guptarud@gmail.com>


