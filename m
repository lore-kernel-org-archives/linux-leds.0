Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54B434E28;
	Thu, 15 Oct 2026 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093914; cv=none; b=pc5Min4wrr+2EpNe2y5sIhlxzYWyjB1UfRtiFg/JdPDkEL+VBFkcmPOwztZfj5obp9gxwjUkxdFUrhvHSuV+Ge+yoZVZeULbQ6ZBKZZjzCRGXEVIREdGFv+8p3M9ryKpjf6+PxU2S6+QZgm9zSSvUbvV8WQz8y5+6EhendAzyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093914; c=relaxed/simple;
	bh=MBMy5hF9tc+WyBW737xtv12ZKOWkSdBYI3j9zf6PxWY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EDgyptiJzIeW1rtOaMXM/OgkKLxgjEK4efvhkrT1y1Xdp2Cul6wCifrPRFtHzR5PCoxxJLxUovty0s9kpi8qnY0GzImecdno9IEisUqsglThbfqpWaynaZLYNPQHJ1BJtwafEZR967KQHO4v3wyM17E/aLxs7Ug3tDDj7qadmbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTi+mmJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTi+mmJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557211F000C4;
	Thu, 15 Oct 2026 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792093912;
	bh=MBMy5hF9tc+WyBW737xtv12ZKOWkSdBYI3j9zf6PxWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PTi+mmJlIoXmY7b9Ssr87Nz/X8gq5LoVC7kNJHbR41aJwluVLxrHMPVy0U7h4+Fbh
	 vLCOoDD04lp4sz38o9HLTfNCze2Q0FPqr6oDLyib6s9aO5YuK0Y8XAahWtH0qynJCQ
	 9HlC2oEzvM0FCKd69s4Swv4hjAo2FuxWYMkna/KNXWTuWKZpeXgx7KRxlXv/zEBrR8
	 RwTUHtIRb6viB3e+2bzm5j6IpWeSp+zdrCchtNGsuOoPGLaoi7iwPtabXALg1eGrRp
	 ltGQfCLnM9VWd6IeZs3CxUwdMvgpS5iyjHy71SQ/NOBcaBtEMMl/R/hg1hB0+mc+mO
	 wyblgkS/1cqLg==
Message-ID: <sashiko-outbox-173368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:51:51 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message description is not capitalized
--

commit fdffeb52b0445eebc400d36aacc9eefa0dff0de2
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible

This commit adds support for the PMK8850 sleep-clock PMIC on the Snapdragon
X2 Elite by reusing the PMK8550 PWM data. This enables the eDP backlight on
devices such as the Lenovo ThinkPad T14s Gen 7.

> leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible

[Severity: Low]
This isn't a bug, but the LED subsystem guidelines request that the commit
description following the subsystem prefix is capitalized. Could the word
add be changed to Add to follow this naming convention?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015194732.6442=
8-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
