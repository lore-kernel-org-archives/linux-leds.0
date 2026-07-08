Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132803DE423;
	Wed,  8 Jul 2026 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494453; cv=none; b=ahOJ4NlVIGPv+dgkQzXewcVw+t7v2IgG5dW/D+XciwlefUU7jTz0/vruNwQhLtD1D0V9SdaBbb+V8UA/QHuxlzrf5xG39yuZVOkSx23xHdEizp6VjnpGLJhhY0+Fw+v8rPk8IBcp0ibTKc1CEEuM3ZmNmi3ZBPKehIePQqw8lPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494453; c=relaxed/simple;
	bh=l2BXAXwNYGPOfEoAw7pTvjkR+y0bdA689ob7zttLyOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pBZWi94+PAmE5lQV24+yuePRVYO5NCO/l8K783qBa8DGLdmFgGtK12ienPxthXcMc+ZgshJhzrJnnH2LkxNbrgSs/UKbmonLubkd34gBMtLfmnlO0C7Q9Ny4zMpTsxlmpT364tJAuVwIbG4nPPrTH5OjZGI0GpOW8mDi+Njqzwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLXAiPU4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLXAiPU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C041F000E9;
	Wed,  8 Jul 2026 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494439;
	bh=l2BXAXwNYGPOfEoAw7pTvjkR+y0bdA689ob7zttLyOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLXAiPU44x9bsXsMNfhR64r1mkYp61fdxHEpZvzwE6EoTS/GNPf7M9vtJkOeRBwDq
	 KtQWP8UTzRFAZ50zGkGQg6EgCw4LRbpxxokVtb1k1OT/vn9VZIjGwMrdqX8AH8Qt3n
	 G4JuCBtuHrtpcXkRTUkJQKjlgXUR6On7yxGVG+QbEOBQidqU666VBtgk/RFREL1qqc
	 ZqSY6my3Ac35CMs4dYmBIadVL6v1JURB034lDYtFytoyEtyDBuyPK+vyXJLWgYuwZR
	 itpWjgw5GJW0zWgFoL0FchVzsT+uDu3BdjLJD7QHljIPEVEKfXN/mbb0iHARD1Aqb6
	 tMdQnWyipabnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260708-upstream-ltc3208-v7-1-aed7f7bd461c@analog.com>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
 <20260708-upstream-ltc3208-v7-1-aed7f7bd461c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:07:18 +0000
Message-Id: <20260708070719.36C041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-upstream-l=
tc3208-v7-0-aed7f7bd461c@analog.com?part=3D1

