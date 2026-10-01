Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F72E7378
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837403; cv=none; b=m3vvqLf8QG5jxlKudLL4MnI+5ozkNXH2qRjTAkZTHyRQobBJToIxpnLuGAivtpY9f7NRhsnv2ljDURlNfrdGfB6KhqprAxb4cmL3LhHF1mYBG4le91tXpYOJuZlrN8aXAl5w0/feBHMbQDRnC5BGPClpULu7YLVVxblV17hTVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837403; c=relaxed/simple;
	bh=CGuWqWlzhyuz3hUF86vS1i7e7F+A9EWe7o7EC45wtFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NcENA7xyqc55/nhgQ/BoeRUE+M3u/dLXGiiANSrfMAiK8y8XoTntl3+2J25j5U+rabU9K52f4fviUmWVyJokaAp0J+XGE3QfZMSETe9Morfej2XJsdfrs7Y5vk4iAi78oXPZmbTuEKw8LaRc0nuhKy8Lh83Qu+x5Fq/9RnJ8p9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WifWdAmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WifWdAmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2E31F000FF;
	Thu,  1 Oct 2026 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837402;
	bh=CGuWqWlzhyuz3hUF86vS1i7e7F+A9EWe7o7EC45wtFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WifWdAmcYD8eDZozjWvAzKdIE9BfvAPRLHgYb+gkrlbNoVeJVAqDWcC5PZsJ4duUd
	 eFmqV20wVCFoUc0xpIaF6omWBYptb4aDOEpOMhDYMUMPYUNzN304t1gXhq33E0CuiL
	 Qxe9JuaqABXEnU6gdGI7CaHkDnnD/IAK1i1SmVApDFWZ3BoU1mGUd9xigUZLAVkz5H
	 buA3NsS3Yzsi38xcXRInm1QjpI+eaPLqv6vYZL64qHF6529dGcDUmv3Rksrg4eeZeV
	 9DTBpFMkVxau8tbkITlEdNke8fYREhS2cUc/RNYA5D9Wp/z6/2DHlzy7Tz97t2z8nc
	 IWnxM6jWKYckg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] Documentation: ABI: leds: document timer, heartbeat
 and activity attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Ho" <wayneho219@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261001-docs-leds-abi-trigger-attrs-v1-2-54f0529bf0f6@gmail.com>
References: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
 <20261001-docs-leds-abi-trigger-attrs-v1-2-54f0529bf0f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 06:50:00 +0000
Message-Id: <20261001065001.AD2E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Wayne Ho <wayneho219@gmail.com>
>=20
> The delay_on and delay_off attributes created by the timer trigger and
> the invert attribute created by the heartbeat and activity triggers
> are not documented. They share their sysfs paths with the oneshot
> trigger attributes, so adding a separate entry per trigger would make
> get_abi.py warn about the same path being defined more than once.
>=20
> Move the delay_on, delay_off and invert entries from
> sysfs-class-led-trigger-oneshot to sysfs-class-led and describe the
> behaviour of each trigger that creates them.
>=20
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-docs-leds-=
abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com?part=3D2

