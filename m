Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F78003D
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214306; cv=none; b=aDDAUo3e/Uei1lqTNYKPihACghtnzX5UKJPPp756FfimXmVmdgWgYuHT56eib4QhBC/LaAg4vr3FKUjQPjLJYO7EqNlPmOQeFxUCRVxlpIHzk2TlVKWo9JtkucVzU3PuQdcWFkWf7dOsTKPTYfKXK35ROC2Q3uI9cTpZGHw0Gnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214306; c=relaxed/simple;
	bh=8YoTBCKECnWmyfWVcRMWB1RbS/Cl5VfJQJZam52RdvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GkrVKaKd3GYxhMRWP5fDNGqypafSeTZAqcpV4P+1Y4wLTfW9/lrQ2/I3mcaLcNWngOJ8XKGhrQJm6f0Z1jwKny41XwmPkcNdCRVc7mmxiPNp7lQFW+m4VWbRg0ozCfww5uRSm/Y4oYRPrHJiSvaalzR+ri7ja2t+hzSZ1osofII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPrhnA6l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPrhnA6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3031F000FF;
	Mon,  5 Oct 2026 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214304;
	bh=8YoTBCKECnWmyfWVcRMWB1RbS/Cl5VfJQJZam52RdvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPrhnA6lXVq0TXGb47nYLXm++3Sdc9gLovCQG4Om44KHt4waFBp6VGH5qPDQRyast
	 sOM0eoMidtiriPTnWJK1LZl9Rscq5TEsw0e8ZWjFDAGBuAhSVCkqoe1DXbySFVRT0D
	 I1RhbgGUA3dmMmST/Np4DpiX/oVlxNIAI7TXGG1qKa4hHmm2H9RChHhXLKgYUeHG/T
	 i6uTtaq2nvHL883umt2PUZOdtAnYo84cXyy6I60Bl4nig5XUXEXl31c7RpvoamTeP9
	 J+Bejhfh4iX+f0Z/LnAeg9e5wxdFn4qaxG0FQKPtuzgOO5ZW6Fh0hFbsWxI5zJuGFE
	 0ngukNeO+8Erw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] Documentation: ABI: leds: Drop stale gpio
 trigger reference for inverted
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Ho" <wayneho219@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-1-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
 <20261005-docs-leds-abi-trigger-attrs-v2-1-c5f8970b1b42@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 15:31:44 +0000
Message-Id: <20261005153144.BE3031F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The description of the inverted attribute says it is specific to the
> gpio and backlight triggers, but commit 4a11dbf04f31 ("leds: triggers:
> gpio: Rewrite to use trigger-sources") removed it from the gpio trigger,
> which now only provides desired_brightness. Only the backlight trigger
> creates the inverted attribute today.
>=20
> Drop the reference to the gpio trigger.
>=20
> Fixes: 4a11dbf04f31 ("leds: triggers: gpio: Rewrite to use trigger-source=
s")
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-docs-leds-=
abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com?part=3D1

