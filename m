Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E094938642C
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870198; cv=none; b=sxPdffSJMslbRX6nuJwp4DujWxWh3II8TH6c8xLWwJ/zXPQbJErq3FFbw3BrNUIvVjiFDcnX+AkJX5rzOHkOxfzkAPzV9I5Co48Ygu/fHTcGPZrrySFCzwwlGZ04e+2HzKwa3r7Cn/2/rsvCNaJ2UpuZpXlILpG2JuYEUDMPmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870198; c=relaxed/simple;
	bh=qfcnNMmGrUTV7OKCOmsrYZ6wqB7Vv7FO4Z85s9xCovI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kl3/0gFWDY1nQFaZ3717Gb9XdGLCKnTJdse3vGXqwQbpozTXodqerCOHhGX99iDatFVagOpMZsw0/+BcYunrWpYZEEwgN21l+YTD4HNyyYp00xOrfQnOScJKtEjP1vkbrGET1z9a+OBjyDmHVN7ZXaXBGo5lLjoSfjko8zWn11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB0+p+jb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MB0+p+jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FD61F000FF;
	Tue, 13 Oct 2026 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870197;
	bh=qfcnNMmGrUTV7OKCOmsrYZ6wqB7Vv7FO4Z85s9xCovI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MB0+p+jbXncQv0QQb166HlKbcu9lAWBiylK/9eZioY5rLLMYG8KDWXU8e7JnelS8k
	 4r2jsPO1tsXBiqBiNjC4HJA6+zQrVSdKqv8fov4MsLIg7xdqivDEXEvdUR1nqXdOM6
	 GEbsyepOalKIlvkXt/YXmHAivjyf+REE9SWNr1biwuhetX8ZBufmNiBCbicLp/PAOJ
	 bJA2jcO+VcJZmRbX19At7mRBaCIwtp6JFyylgoovkUxQhDCsVqMkLT5W2F+G2mtERa
	 zBovjosBZiHhzIofY7ihaldtTqWSnChJTN7zUl6gQNxTO8qHQhDNHc2CQlZRdGulvV
	 gjIxwaiJunDcQ==
Message-ID: <sashiko-outbox-169005@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-1-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-1-cab1fdd050b6@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:43:16 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The aw2027 is largely the same as the aw2013, with the
> exception of the way the max current is written to registers.
> This exception makes it different enough to not work without
> driver modifications, but similar enough to fall under the
> umbrella of the same driver.
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-aw2013-aw2=
0xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=3D1

