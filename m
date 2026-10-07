Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AF41D638;
	Wed,  7 Oct 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363435; cv=none; b=UHUt058o063+oxeTXnnLju9lwyTcj+/rKuXrR1rYdmNnpr0R76LKwW8nFr5aAedwiFexVvE7b860BUk8acJQqicZubr34D0R/GwyDNiAT+lf4Z7+GZQqyzuhFollIzKtajW5gomuXziQP39l4c2zbA2YzeY4/t1albSA7L3WV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363435; c=relaxed/simple;
	bh=S+695LH2VOFkKIu+7od0/Z+FBwrL+XhpkKvZ+Bk9yCM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JFXAIVUgtDP3TmqppvK2XCjqsre/v2AKftJka8gs8BVnFOJKipFilWQwlDPzRN5DXb0kRgWgk5Lfh5PP7Xwzxf0rSsZZR/fC0HwwiKIfGb5OsfRJkGxZmBy8m8WQxwmQy6OjBVPLGaHyQcpNjX55RI2oxtEs1m6T2uPjfyx3gxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNah1ufk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNah1ufk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3BB1F0089F;
	Wed,  7 Oct 2026 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363433;
	bh=S+695LH2VOFkKIu+7od0/Z+FBwrL+XhpkKvZ+Bk9yCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNah1ufkJtDFzmdaGV4y7gxSy9VAsem0MrkNSStbVJ6OaekkLMEZj8Ch5xSJeJVR/
	 BywUV20HaJp5hQtTTQV24l9IbWFSxBNFmdy8LEA56Qqjophf10DBG2LcEq6Gh2bmnd
	 YqKLHCzObCEhylEjoWnPW4hv76EoNy6KJ3E89QOmKV3XWEG5bloxWGPzZ5efWEacZL
	 IbS9FXAEC/QiTHm4HcbAEVPyJtphr2zE1I++HMnEbLSGhJpHIemoH2Ugs9Zx6+/vdj
	 WKo4ztICjAPy84tiWbh0LDGZ4sNUo7Jyngb1T0fvNZQOLHXMjJ/gqBDgisok62WkZ7
	 Ur5VPXXTQPR7g==
Message-ID: <sashiko-outbox-162760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: leds: skyworks,aat1290: Document
 AAT1270 Current Regulator for Flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261007085457.98762-2-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 08:57:11 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007085457.9876=
2-1-clamor95@gmail.com?part=3D1

