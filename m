Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389441754;
	Thu, 30 Jul 2026 00:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370638; cv=none; b=Neo7zKFCMk4voNi5Dxk6xhhDLVNIlL3QR8wA8X27kRpg6Q/RhbVoDTu4Zxe3iK3uTqHKk5tsRc8CJVrschl6zsXd/6XkNZuQ/fkhA0JtX2qW9vfoaLF2x6BirHuHyW4WOddteq5nsw9FAEhLwiLWeTqTbsGI+CoPZF3xqVaOWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370638; c=relaxed/simple;
	bh=qS1iTfuoCI1Qu8gCUUHpIef1FtFv2LQ4y0DHPuyirnw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cKEPd+Whpdt5xqNwTkoUOgSwyw0Q6mbXY04kGOy4GvCtF4a1nqDwY8pvTvG+rCRoTLRqMGcRmJUg3m0LYsO0zM/+V8/mxSkhE1PA8+hoOFqISunQD9KuEZQUp4cWjk2SY5vqBrsO0yVQ4tEU933vrLmQ4xUFqeASdP/FUqajPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DJVQkpZL; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DJVQkpZL"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL957B3267816;
	Wed, 29 Jul 2026 19:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=7kRaGnM8TIkqN8wV/eWrs7m/Ktc
	jEf6r8jdMNqeUJgw=; b=DJVQkpZLviwkt/6MZgG6zEoTQVYcvpsw6sedlRPhWHG
	+TvLjOjXO9T+xpZuIVFubeY+djFPiOL3FF/syEOomBC8I+arjXlDfAnjMgZCGbra
	TCjPKn2T9C45VdTrW3hSD0ZpAHIELawWlMxadeqgCd0Dd35/3JHLMWkX4eR8vMBa
	uHVKLfRBSM4PGdn2P9a1nWJfMD0iZjUS0g0JCsxuUh+BP3yaojXObjgrOGNZw/mp
	kP8Eef/csCFm8jmRTiKgDc4XpwALjoC0+Xw+xgxNblJDu+E8JiEnJ4jyA3jeyJsi
	F3Foh+X4RGIIG5YrVjwcFbxApoMO81yVs/Fmivo9xnw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fq83jmukg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 19:14:24 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66TNENfa020123
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 19:14:23 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 29 Jul 2026 19:14:23 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 29 Jul 2026 19:14:23 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 19:14:23 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66TNEAlU016385;
	Wed, 29 Jul 2026 19:14:13 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v8 0/2] Add support for LTC3208 multi-display driver
Date: Thu, 30 Jul 2026 07:14:00 +0800
Message-ID: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmJamoC/33RS27DIBAG4KtErEvFAB6gq96j6oLHkFhK7Mh2r
 VaR716cjV0ZVax+JL558GAjDS2N7O30YAPN7dj2XQn25cTixXdn4m0qmUkhUSiw/Os+TgP5G79
 OUUlhuYnROrQhoyNWnt0Hyu33k/z4LPnSjlM//DwrzLDe/oPNwAUX0GTIQE5g8+47f+3Pr7G/s
 VWb5U6QWBFkEVQK0TkZUDh7ENQmaFETVBFMFgGSFETGHwS9E6Am6LUHazUlRdrl4xTNJiC4itC
 sezBNAitwPQcBd4JUFQGLkCOG5Ix2gEfBbIIRtb8wRfCUTDYhaYT4R1iW5RdI7Uw1PQIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785366851; l=4750;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=qS1iTfuoCI1Qu8gCUUHpIef1FtFv2LQ4y0DHPuyirnw=;
 b=oLRX1YiqQFp9MpmolL1aPXKHomyU2TLiE8l7km4JXWyuMSptU66PEZxvmTfhrIXhZh6f/jW9M
 to4A3L9ltRaDdgGyHsgtlSYUGfYKr2uW53A0ZkM44ja9c3OCw0cjeVY
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: dHizSvUVzA1FXAZ1NY4DHjv5Zjv3D6jv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX2IO2PYtpnsRG
 SqBnJLtkB1BPOfMtxD/KiA9xIbg5JARSB3W/lHXO/C+rKi8R1GGdkw0PyEiJ2JuraAJlsnE7te+
 4pIjfk4zYc9iZjBnaTrYi1W5QrFBjDcmg/Sr/2ur3X4bOzs2a0bJ
X-Proofpoint-GUID: dHizSvUVzA1FXAZ1NY4DHjv5Zjv3D6jv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX347m3GxIiilF
 Xim3zga0vPW/aKqslRFtGi4MG2Bl4OHpJzLhk1O7ttHShmX0v9peg0Og9Li8TEiT31Q9Ccf0evo
 9Z7I6fxDtEgNU7g1tVyYlIe9napkZbVXc8gsWObxfMSNx9/Y08FRzp1w0WdHZO8qfnKU+SrRPeo
 xXQZUxHpVu7A0BJLYaA47HHlHOvv18pd5ptsPZocv72GWd9EfTPvJK3AE/xlUCAprU3RffAWB5/
 bqE40zFf3RJQRb++0aVuSG+bfQxbjB9XxVxqr2SVNAn+c28LJnV53J8JskDqJczUe/UCGkHMjxj
 eFXu3GKurCmDBsG7FtNG3EbtYo0kh7VLZ5+F9EJdf0px/+lka/2LBM+Mzx4xg6TzMKlbfIHx+LV
 mj7HacNhgvDI3nIEo6sowB2LHOwboP9frm7DA5kZ0j6jvNjx6ww73rVKa57PVOLowq6yGUKQ57S
 amHfelqWTyemcI1LOKw==
X-Authority-Analysis: v=2.4 cv=QOFYgALL c=1 sm=1 tr=0 ts=6a6a8950 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=i5ZXVECjzu43PgOyy-EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290173

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
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

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 +++++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  12 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 226 +++++++++++++++++++++
 5 files changed, 428 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>

