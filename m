Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547F4718DE
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145736; cv=none; b=Iiw5NVyPPfDbMeQv7WWC/zG4bhfvgBGW6yJ6phnKDnP2J52ZOqwAwDZex7wo6mAJtUXJriBM3mfqUMVdVY+dwd7o8BXF4AtZQqFt0BbuB1vxMWPZapm8zYkJ/5esbMwOqRbVsQfKALxmPojL25UK6xMtGSTJL2HCpQxZUsyN25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145736; c=relaxed/simple;
	bh=rV73hPMZ38I/IpXfgHIwnHztX2flbcvJswYCcTlOjQI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SWYrYbj05R6oyWKsF/fddL4Dr5dwKE4xxoMc05UtaOQjvcmlCKl82p3CnpZbgL9dzPOt6QUGMgbtLYvdkiFP3nI5DkTRGn+oxFPcwisD0NZ01tsFQL4kb+6M+Z+lXthGQ0jY1MVPv5Lm9ulxddLQ6P+fXdiCLblwfHx62CMO1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dp2e+QxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dp2e+QxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C076F1F000C4;
	Fri, 16 Oct 2026 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145735;
	bh=rV73hPMZ38I/IpXfgHIwnHztX2flbcvJswYCcTlOjQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dp2e+QxNelHuidX1Td8D9gBqpGWX3gSd21bkH65tQvi2j0HxRmCkUmQSsTb1LtlJE
	 MZCgq+vyCd1K7Ql0AyrMQ8I7vknKoF5XmBwaof9N1k+7MVMAsiMBCURqbpGZ+Q+J3g
	 ZvVZPRkwPI4VEKIpN/o8d/kl6qDOThZFFfAgnrg8+lweE07k4kNLTD5IXSJTd806tU
	 rCirT2NLlcN8cCz/32FyyryjXIgal5fQtu8+6pjZgI1/mhV7/EWzC5i9Cz2IKK7E0w
	 AadJ5VmuF8IBCMi0cxt241IKG/hNSIymmtyAcCjt7aBHyzVn7FeCtri/0TWKD3C4qj
	 vceYu0apC2vUg==
Message-ID: <sashiko-outbox-174136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] leds: cr0014114: queue recount work on freezable
 workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261016100435.2581303-3-yaojiale02@163.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
 <20261016100435.2581303-3-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:15:34 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: Guideline violation: Uncapitalized commit message description
--

commit 2ba0c5cc8cf57633496ac16ae32b61b6ab9d6609
Author: Jiale Yao <yaojiale02@163.com>

leds: cr0014114: queue recount work on freezable workqueue

This commit changes the recount delayed work to run on the
system_freezable_wq instead of the standard workqueue. This defers hardware
access from the workaround until the devices have fully resumed.

> leds: cr0014114: queue recount work on freezable workqueue

[Severity: Low]
This isn't a bug, but the LED subsystem guidelines require the commit
message description after the subsystem prefix to be capitalized. Should
"queue" be changed to "Queue" here to match standard conventions and assist
with Git history categorization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100435.2581=
303-1-yaojiale02@163.com?part=3D2
