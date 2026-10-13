Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085D528441
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915707; cv=none; b=mWyWlHKBcQFX52TOTMAUB+dlQgG9zhzVa5N7uMJSjdxpkjXFnTlYeFO8plC7vh22De+n1P969iI/TWd7+C1vsWTWgnwUUCz72ZsUH+rjoNdMa7+zaZ8XcGp8L0zGzFXryX03emlV24AU05bR6IG74NusAxLNiC/DvFb5Y0Ohhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915707; c=relaxed/simple;
	bh=hYtzqUEfrysZy8HPApU1X/KIV3AQ9bRTNHpSlLWT2as=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cu5KbkFvkfmzokJTVocD8FKuJSTxGJo3O2hqkVXzqStQWQBvid8/7udccws0knrdEfBkOKmp/aydTqgZuyl9RluWF7FPnC/iXEkd6Ghh22ZieTAu5HWa4fw+xB0n5GhkfEJ25mZxRgZSx8dSOmSWDbDUHjova0efxjI73RmRkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaXKzXQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaXKzXQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A431F000FF;
	Tue, 13 Oct 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915705;
	bh=hYtzqUEfrysZy8HPApU1X/KIV3AQ9bRTNHpSlLWT2as=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UaXKzXQQa4RZQSUu9dZ0sfsRYCa5zPBYakfru9OLdObBV/PXZog6fjdLTPtzeGAD/
	 tdBX4FB6a3RPG8OiTw7KZIU5OMEIMHRtxI2vFIA5ykJP+05ubWsB+55FHwxypElTrS
	 NbLQ9Z3q+gRjkPuqEVdPgmtC3FaIdPBOuupvnx/Kc8cJBYSryx/XwN38r5vZpyfIZh
	 wZHn5FWfXwWLQxWcgoeKH8s4tJhgegNzM9vUKwbOPgP9iIezYtNcLuaXC8UtPjOopx
	 kro8eql3+UxQNR9ADcyxz+W/qCmtRXLuJkbSDSmFVe1JBbXhBS/LWxVcOT6i5gYIvr
	 y+p1chAZ5aamA==
Message-ID: <sashiko-outbox-170319@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: Document
 AAT1270 Current Regulator for Flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013181803.496627-2-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:21:44 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The AAT1270 Current Regulator for Flash LEDs has a similar configuration
> to the AAT1290, but it uses a different programming model and requires a
> separate compatible.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013181803.4966=
27-1-clamor95@gmail.com?part=3D1

