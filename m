Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E142CAE7
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887036; cv=none; b=AVx0UQTuOs0/24xl0S7BC/hru9v0bx6Qv3rRZdsLgDe0M/6QLEvn8XKE+fI47fc6w/gg5OlOn7YY3pQpBn/CWlSh2r5iDOSaUMHFnfL1UIKGW+tJerI25cNxgJeBSMRu1w3pSYxKXsscpMDiIr7MNkCtHGtre6Wg+oPs4lo891I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887036; c=relaxed/simple;
	bh=ODJBQuUCL/ZYsMRJ0afjKF/zVH+jtqh2ZrcMwH+yfCA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tqHekGaylAbwgd3MT8WGuMQFHD5FAGQ1hra6Rl0b294dEJBM7EbVJFnzJ4oWELURlWjHUUoFk2bc+E8at6r12S8DxsEDoiV+Wh3Tj3CLJ1mkxAAL4PLJ9TMi0T8Q3hSYxqHdxhLELPxAZ/bbr50aheaRk1StMK/7l5mOtIIR5AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9NBITnw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9NBITnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F251F000FF;
	Tue, 13 Oct 2026 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791887034;
	bh=ODJBQuUCL/ZYsMRJ0afjKF/zVH+jtqh2ZrcMwH+yfCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9NBITnwhVvs5LOwSlY6T2bHvD9fU4Ko8OccU+pO2ewHZ23XJKclnXV2EJRQuXXvr
	 iMoGpzb+Hgrc+5m/M6ToiwtSS0XbuCw2xkdRhWKhAC0qC8s9JStNWB7Z6FwsqAMvxs
	 eS3grYkK0j+dEl6g9YCPho62UyBVlsFEMVbp+JCjFr/o5nNxGbZCQxjxHMKllH+yM8
	 XG8wB8R1+tPSdP5WF9xq6MNQA1CZqwWBbWNk+ltrzEEkLV81oAIEG4BvK0Qukp3+3L
	 wP0e8EwuIOcTRN2WKJalG1gT3fJjrvNfk+XpDo7fZvsq2nXd1Bt2CQR6W5Dy4VSyvi
	 RU5oFqpMUk2CQ==
Message-ID: <sashiko-outbox-169493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: is31f132xx: Add support for is31fl3206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
 <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:23:54 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control.
>=20
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
>=20
> This commit adds support for this IC following the previous limitation
> of the other variants: all LEDs are enabled and set with maximum
> current, letting brightness be controlled by the PWM registers.
>=20
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-add-is31fl=
3206-support-v3-0-66a762a3c12f@amieiro.net?part=3D2

