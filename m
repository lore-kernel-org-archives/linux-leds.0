Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179E3B27EA;
	Tue, 15 Sep 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482015; cv=none; b=je23P9lxWD9A0Lw+EntPNpf3eR4AteRtKhCvL0DcO/vKpV3+LMMTQ1g0LNufyKX2h22ePb9MFQn0ZuFe3uNfPMROD58aN1IyW2GBgzrF1M74izaHgiRJDpNE/RrGv5/YyKFUxiJ3JijeYWQQ790Rd2fj06Xof/W1PukLbW8z2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482015; c=relaxed/simple;
	bh=WoBK5E1p/C5eOByJEIp3XzTk1bhE++DqxmskbjlE2dQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bo9CrXIIAmVm4dAnNs/LmAqw7acK/F/UE31jOR4vuzCcJgeZiOISfFcoBmZL8cClleu3s+PW9w+fq5MSvy9UuGYzsLHVwfWGPNfDCTMYsqJEqGzCQs6j6OqoKgzWXPUrVUjnYN0KUn7lxTG7uR80WX8YaTDhVKC0eJ+aBFadc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFiW4B/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFiW4B/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE841F000FF;
	Tue, 15 Sep 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482013;
	bh=WoBK5E1p/C5eOByJEIp3XzTk1bhE++DqxmskbjlE2dQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PFiW4B/Z6ma3yZpJhIdH7+bS9hNTfWc8uRDAxfgPZgNTbY83hyaR6Z50hO099+XsP
	 Jz+QESvQb0JBVUJiGnn2Xg31CCins/rYh1qtiRDVKYPq6/cGJMJkq0G5MVF8kyI6II
	 jM8SBce3hAe0AMuKfs3AnZwTJiIRTZxQsdl1yDzEd0mS6WZWNVD82kSzdYOb5aLtWv
	 LJ9ltYdINH1IMRRzFxH4Fuy9yRRN80p3u/jZf16DcC4i8iF0vPYWBgG7OLWh2MWLiQ
	 +QQkKPdOaJ/wh5ULngMuAvzHMLeaOy0YQDQz7liL4AfymRL1YXC8gW7JDzId67B6XL
	 Z75MngatWZnFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: leds: pca995x: Describe reset-gpios
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:20:12 +0000
Message-Id: <20260915142012.EEE841F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/PCA9955B/PCA9956B have a reset pin. Allow describing it in
> the Device Tree.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D1

