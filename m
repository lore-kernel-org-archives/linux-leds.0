Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A4312834
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575924; cv=none; b=fTCZBW4Z6SfN6GABHzD6ICwuD2Ekm8/IKfluk081l6NvJx1Urpc9iLwbMpE2cwfrVBTL5gef5iishrjIZyCSg4jgaktw/1yB00HDhgrOKETo3LgjlfQx35LdeG7gLVHa1ySJGbcOyvN1XWHOuyPBRVJrbbRCRosAfN1kr1WCt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575924; c=relaxed/simple;
	bh=bJsQXpuATrYcNSoqJ48gAdbcEhaOO44BXbRADNvMNLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XqrBloGBF1fLniVvxgsj8ihQpxCUfmHVn/661Q219SV6ZTEEU68aJDc3Oo30O0XUO4fbcUlLHvV1iFb2UQ8JYoBWkSqQ8O2kg21xNc+JVt28yrhGze31JPoy6NkARsUWraAZWNtrvymcmOEu7lpr7y6kNDTI1yU4cSCrTjCCdtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXgTgwy3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXgTgwy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBD31F000FF;
	Wed, 16 Sep 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789575922;
	bh=bJsQXpuATrYcNSoqJ48gAdbcEhaOO44BXbRADNvMNLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXgTgwy308pnefQ9QdVUyrmIds7S6xhQ4WLzoJLEAVnxQfm1+CipBy4jmhQiqV9xU
	 slceEVsymrL/FND7mrDkvdPihzu0hDaLfV2e0qy5A2o2YJXte36/i3Q8iPmb8ZfRSb
	 Jx8rwrOR6kD/UszzHTGxuqZmjjKKG95Z21Wpa5xIFnvtNygCy9NFaT7khp+f4pztAT
	 oUxhv49KAc00cJco8gR92QRtQZpPkzMoKVaIIhrfSGpU/1PkiLnEJ5FwLWQduXrPHn
	 cS7VY1wQd2w/3kbr965fA7Zg1R4UMfDzfLwuHKwg8+QREYiPqR6nX8ZOF21KQlTknm
	 ba7X3W20it4JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] leds: flash: Prevent using uninitialized
 variable in flash_fault_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260916161607.90106-1-dmantipov@yandex.ru>
References: <20260916161607.90106-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:25:22 +0000
Message-Id: <20260916162522.9FBD31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> In flash_fault_show(), address of uninitialized 'fault' variable is
> passed to device-specific .fault_get callbacks. This is not a problem
> if such a callback directly assigns the value like rt4505_fault_get(),
> but results in an undefined behavior if callback just performs bitwise
> ORs like as3645a_get_fault(). So just initialize 'fault' with zero.
>=20
> Reported-by: sashiko-bot@kernel.org
> Closes: https://sashiko.dev/#/patchset/20260904054437.461706-1-dmantipov@=
yandex.ru?part=3D1
> Fixes: 7aea8389a77ab ("leds: Add LED Flash class extension to the LED sub=
system")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916161607.9010=
6-1-dmantipov@yandex.ru?part=3D1

