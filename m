Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A4305699;
	Thu,  6 Aug 2026 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785982007; cv=none; b=cWaS01vvrTJ4gou65JT0gFEor60gN9yCThalKkpI9C+nsLgaGz9FmLJJsAe3F5y8rMTp3NzCLBgxu23hZrw4Kuh1X48io8qUy62QmEV3UiziCtSQpnTKZ8xc517Q9zQaLsVv36HshG2qIBvV4vZX4Jr9P7mxID8MnA19DlpgV7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785982007; c=relaxed/simple;
	bh=hkCbB2oibLbW8sYt+fMY27WJqjSbwiIDATCw/hUqfVk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=MCEDfqxl1CmVWDdpPF16vVpCM42cuxHD3z609yRQ+3NWuiYjn4ZaLYOj9JdL+P1J1lu5c263RWNAnPSLCbipJyZE8WOpZ9FscmyXvls0DCl+9PE8ni9BAOXpGYDWqAqJUBCwMFigJWrDpe9I9W8EXo065nz2xlFoJkqAhuzSop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=GOqlRb23; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="GOqlRb23"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nb4TO1792970;
	Wed, 5 Aug 2026 22:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=o4xb26HtOezW52FTBP1ttacJzGu
	dyleGlin8KXavO+c=; b=GOqlRb237p5Z2zZ6ErNUxBIfw/Z4+4XfNjqdY9prqFt
	fmDxtuPaxgNQ49lWwKWMkeJk3uF1mLR/vek8j51uXgaV94rDvCNu0Gq6/p4ihkGe
	nssIidQG3IX+at34Ltd5eT2LU5cLpS5V5qpir7Zb5j9v6qbfbppKwjt/zuR60Dux
	chvr/e+A17L6GQgmiI0cvOgl0gmZ+1nCYK6jf0lrqFMbBUp4um5/8QbuDybr36af
	0PzF/M01Bzznq/fk8ioMqZh9ik1qYI7/0kpc0OZlfYBMSM9vm4TrB90tR6FM4T2N
	Ed6ULp/8YlunU/NeM8hAdhEvWqQ8zfFoXQyf1S6bO8A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fv3a33s3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 22:06:41 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 67626dYA038118
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 22:06:39 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 5 Aug
 2026 22:06:39 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 5 Aug 2026 22:06:39 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.41])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 67626Rbl017246;
	Wed, 5 Aug 2026 22:06:30 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v9 0/2] Add support for LTC3208 multi-display driver
Date: Thu, 6 Aug 2026 10:05:15 +0800
Message-ID: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANzrc2oC/33RS27DIBAG4KtErOtqeA3QVe9RdWFgSCwldmS7V
 qvIdy/Oxq5AFasfiW8ePNhEY0cTezs92EhLN3VDn4N7ObFwafszNV3MmQkQCJLb5us+zSO1t+Y
 6BynANiYE69D6hI5YfnYfKXXfT/LjM+dLN83D+POssPDt9h9s4Q00wHXiiZMD1O9t316H82sYb
 mzTFnEQBFYEkQUZfXBOeARnC0HugoKaILNgEngeBRCZthDUQeA1QW09WKsoSlIulVPoXUDuKoL
 e9mB05BZwO4WAB0HIioBZSAF9dEY5jqVgdsFA7S9MFlqKJhkfFfJQCPYgSKgINgu5gxCkJtTR/
 BHWdf0Fz0BUSH8CAAA=
X-Change-ID: 20260318-upstream-ltc3208-7cc8968bf69e
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda
	<jancarlo.roleda@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785981987; l=5014;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=hkCbB2oibLbW8sYt+fMY27WJqjSbwiIDATCw/hUqfVk=;
 b=Ydt//+ZfhSI+hXjVAqoe7eLMttjJsBtQb9bQ0zOMFl28XdWuexFmICumgFPqqgUx1fD5yc1Q1
 xAQFcOV77prDZ8sSUMQ0zfKGDjrMPIzimlazA6ZAwkwO9uNUmMzDg9U
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=CuePtH4D c=1 sm=1 tr=0 ts=6a73ec31 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=i5ZXVECjzu43PgOyy-EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TyfnD05Oy8kT3g9vQ7UvGtjA2ScPXI2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAxMyBTYWx0ZWRfX+Wgfz5nLdnJS
 tTJStXIXd+JrXcX6sDLwHZUB7dZEAJUNkE1Glhks+9Zlad2artZOBivV3wbQ/+bvlbhC4d+E2fP
 ec6mY4DXi32KR43ep3L7iG0ECm6m7fmDluo+r64dNrIOiHDo44F+uln+xCg69cH1xry49n/oinS
 lnVTDpBbIn0Lo5wFabus3hX2eKu4w8f6oCAHLogvM6vzggID98XOMemI1eid/BVa9LIGPZW0lEL
 MPYYwP/dK+P81tvn0A+XEELBWNG9AzJISEPbTJfyvhy6wjupFcjO8I6r5aB+P5RnhhjIoixQBzx
 FMQm82sWoCqDaDspCt0Wtjf7D9e+1KsiMTcoAZ/UWcdGchZYt0YVUPL74PikplmRm0GufsRh0VN
 SDi3lcDRkRX1moF4yMDhYLjplByQo8LqLvDERcVWvn/Ia9bA9bF3LgQCx9NrQBzd/rNdVrTUU1g
 mX5upfkP7UV4bgwnSxQ==
X-Proofpoint-ORIG-GUID: TyfnD05Oy8kT3g9vQ7UvGtjA2ScPXI2r
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAxMyBTYWx0ZWRfX2CpWjOtDm9yM
 Gc+qAZVuSDMsAgYGHHI3IoLk3EygloSHAXspu0F//vTPHS9d2t5ZNifqBQyfr8WT2RpRdAwzYJS
 Ge9+mqkwuDDVQmlGajMNKl9IgrkVFhE6Vfq3sZyGptD6ijlSa6Bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060013

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v9:
- Add "#address-cells" and "#size_cells" requirement to devicetree bindings
- Add regmap hardware synchronization to reset value (0) in device probe
- Link to v8: https://lore.kernel.org/r/20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com

Changes in v8:
- Adjusted register define comments and formatting
- Adjusted aux channel string declaration formatting.
- Removed I2C client from ltc3208_led.
- Replaced struct ltc3208 with a bitmap to validate unique channel
  registration in probe.
- Replaced ltc3208 kzalloc with individual ltc3208_led kzalloc in probe.
- Added spacing to each bracketed item.
- Adjusted formatting of reg_field declaration.
- Replaced reg_val with dev_options name in probe.
- Adjusted error messages to be more descriptive.
- Removed newlines from error messages.
- Refactored AUX channel configuration to be more readable.
- Removed id_table from i2c_driver initialization.
- Link to v7: https://lore.kernel.org/r/20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com

Changes in v7:
- added reg_defaults to regmap_config
- removed i2c_client and regmap from ltc3208 struct data
- fixed typo comment in driver commit description
- fixed string formatting of u32 chan data in probe
- added explicit CPO set to 0 in probe
- Link to v6: https://lore.kernel.org/r/20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com

Changes in v6:
- Fixed code conventions (spaces in brackets, awkward line breaks)
- Removed unused `i2c_set_clientdata` from probe function
- Added guard for potential errors in AUX channel configurations
- Added guards to prevent duplicate LED registrations to the same ID
- Corrected `dev_err_probe` return values
- Link to v5: https://lore.kernel.org/r/20260619-upstream-ltc3208-v5-0-075d18060606@analog.com

Changes in v5:
- Fixed MAINTAINERS commit ordering
- removed i2c_client from ltc3208_dev
- renamed ltc3208_dev struct to ltc3208
- refactored brightness_set function to use regmap_field
- updated leds attribute to use constant size array
- updated regmap_config to use REGCACHE_FLAT_S cache type
- added max_register to regmap_config
- renamed variables in probe function
- renamed map to regmap for regmap instances
- moved AUX channel configuration inline to probe
- Link to v4: https://lore.kernel.org/r/20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com

Changes in v4:
- Reordered commit order to match dependency order
- Updated Kconfig to be more descriptive of device
- Added led@0-7 with more complete example properties (function and
  color)
- Driver changes:
-- Removed unnecessary include headers
-- Formatted macros
-- Created helper `write_current_level` functions for LED current
  configuration, using `regmap_update_bits()`
-- Adjusted awkward tabbing issues
-- Updated variable names in probe to be more descriptive
-- Updated inline comment capitalization
-- Initialized `i` within the for loop in AUX configuration in probe
-- Refactored `update_aux_dac` function to use array pointer
-- Fixed error messages in probe 
- Link to v3: https://lore.kernel.org/r/20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com

Changes in v3:
- Edited device bindings descriptions
-- removed full stop in title
-- replaced quotes with double quotes for consistency
-- removed <dt-bindings/gpio/gpio.h> from example
-- removed led1-7 in example for brevity
- squashed maintainers commit to driver commit
- Link to v2: https://lore.kernel.org/r/20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com

Changes in v2:
- Addressed DTSchema bot warnings and errors
-- removed extra blank lines
-- fixed $id to match current naming
- Addressed Kernel test warnings
-- fixed bounds for aux channel configurations
- Link to v0: https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com

---
Jan Carlo Roleda (2):
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
      leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 183 ++++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  12 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 231 +++++++++++++++++++++
 5 files changed, 435 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>

