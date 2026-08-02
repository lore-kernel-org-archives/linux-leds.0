Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FC26F476
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691910; cv=none; b=bmvo6OAI78HhyEAps6LosccKS+ZSDEQm/D7cEzYqd2U6iW7fDZoUH6zaaJolTAwluoT5NZdGkNoJdPfcrwHxgtK+iYlDT0nFXClqm+js4p0pu6LH0jH19zuQ5y+D2eFDDqw6jtOWmXmPNDxsoOXXwYuVEGJuEv5PUDe3v1fd3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691910; c=relaxed/simple;
	bh=8mry/7N5zViyLVIGSusr9wNBV9dGk5Mvg05IkWyUAxw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EVv0Rx1bWufWKPXTFKCAAQs91MiO+76IuuHfVkFkCc63Xl3uFfkFitx9YTiDsOnXqJyfWYX9zAILjloX0XEOsNVX43n7FQBj21jgMHVFq1kYqI9QbQzpIQRRWWmJP/jfWotNpy2UNB/L678YC4ElmqYMuWzDwPeSOlFYx00w1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kla3Qy4L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kla3Qy4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397751F00A3D;
	Sun,  2 Aug 2026 17:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691909;
	bh=8mry/7N5zViyLVIGSusr9wNBV9dGk5Mvg05IkWyUAxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kla3Qy4LfuYE1NJMP94aEQ335Xi2s/x5SuCHhHlxLnKs/YXK3zUGI3ncm3URNMvy8
	 pv8cFBUW85WFp6wYAiw4Gj1np9znm0mJe9H1U5xDQeoIFu3KSjU47iQCi9lg4zH/a0
	 WAFExJisMCOjNBKkGn1cc2j+4Cjnz57VaGju0Hs6pr9VDdMSGQTSEfKMu8bvzIrUUA
	 X6lKNRsVDXEMJRBEmBc/cvUFtLlMHC5oNHnS5zybFZ/SrMoAJHQXelhdyvpa5YY4ZG
	 UH32ry6CPY51vO3lGZGOdQT246wD55KCsjxe2Keyv6YgdWAJcINPkwdmB0/aGxdBwi
	 4FTTZx0pFSA9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-7-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-7-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:48 +0000
Message-Id: <20260802173149.397751F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> With all existing triggers adopting the new interface, strict checks
> could be enforced to make the semantics of hardware control triggers
> clearer.
>=20
> In detail, a hardware control trigger should:
>=20
> - Implement offloaded() callback to indicate hardware control
> - Associate with the LED classdev's hw_control_trigger string
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D7

