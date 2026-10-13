Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21966525A80;
	Tue, 13 Oct 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913406; cv=none; b=FEy4h/j6Ub3PFCOWxRrsso98TQhFOg8DobYF6Lj2zcs4KWMz3ox3oypktuVWbjV/tbNhyHqYiqEchpkVqSjaqe6foh572yyA/48gb+4mD84sFzoNghT039CJyhPsY58df7icG+lmqDlaLk30Hzx8PayvdJveOnbd1NLPhJITD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913406; c=relaxed/simple;
	bh=t+CnQYS4KOXvQjgFjHXR366KCQB7nbJKBXio433ruuk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pm/Xlay654znYi6a9nXxh+4EAIwvg2TVmPQPDVHkgnSH1/4c/RvPQky7eFz+FQbAmDh8BpNgtdnwzpI/ywS80eImU0o7OULeMeHS+hiw4rzwvxf47GM7KkqvNN6VGHIY0V87ZDvNdaiZ+iLO9P4QyPGuENNPSfpNhBlsve3oDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMTcDdfJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMTcDdfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DC11F000FF;
	Tue, 13 Oct 2026 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913404;
	bh=t+CnQYS4KOXvQjgFjHXR366KCQB7nbJKBXio433ruuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMTcDdfJEIvCkrluSmcTcT/oPpoAp92wci0i6Z4PXqdZq8W/FjG4FJVwnvd3f64Xy
	 JQng/TlYv3BVtVva5lpBGKPIOAoIXiDzBkMCurAnXaDwnO7ZxGjF+g6IX1NeCMvm5S
	 aRxEyq6Uk3taGhZTyIDlgLYIdZ04u62H222mk0aeRe8ASXTpx7WbKmpSCGiTwjUGbF
	 FI6lqrAkYZ3LNCSOXSWj3hNzVwzDJAOFl1gSFgjJPkAMtP6XWOxgrBqPw8lvDwX7gm
	 chYeGHlv4SjmZ2WzMOg4H7iQq2WMh5wzcYTOvulYKhT4hIzTvqjHlW3IrBWHbEI9TF
	 oR/0RBasbydfg==
Message-ID: <sashiko-outbox-170252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer
 battery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013173504.451391-7-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
 <20261013173504.451391-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:43:23 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Driver implements one battery cell per EC controller and supports reading
> of battery status for ASUS Transformer's pad and mobile dock.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013173504.4513=
91-1-clamor95@gmail.com?part=3D6

