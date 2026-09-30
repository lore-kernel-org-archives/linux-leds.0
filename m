Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6FE4E9C21;
	Wed, 30 Sep 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780568; cv=none; b=GOk02LuViSANul2lf8rwNSs1DJ1NEMhLQ1nP3enmGgfThxh+hvFjAWeYCU9aV/YVGUuijCMCL6eZy02vQt9iy5cp1yw+xfwuO9v0rn+C3hIC5dCbQbLMwe88uo0qO/kC/ZKjX9ZIwK3A4EnyQQSgt6/VBWuWJuD1XzhIKf12or4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780568; c=relaxed/simple;
	bh=xUrHuA8ErVfSqSq7rS7/0mMhkC0CwQKHQ/uwV6i1Y7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g1X06FzAvzoiFNWa/PXjdT4DOjOc2wQqVstwr2CkaSH1ld9OiNm5f88vKLZ6/TnYT11s95IoqfABXO/ECLj25gcYSEigTCKsnvtg/TNQgnuC8CiKP9bon2YzQZbrOeJvrZq9aRGN63Zx82MuLVCqsXB3WPhW+j54z/uBBfVGBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUR4lml2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUR4lml2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6301F000FF;
	Wed, 30 Sep 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780560;
	bh=xUrHuA8ErVfSqSq7rS7/0mMhkC0CwQKHQ/uwV6i1Y7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUR4lml2n3FLcljAUsintMsIfCKmCws+y1aP58W6DMWnvVCwqgtM8QuzzpZpuuOQR
	 Xb+LDoluDzgIn6eiNVcpgy+uHVpWDqFwumVr+LqWOWDWch5jsLQUkSedAprYpzbaVn
	 0WtNp8edql3/mydpDU6+lO7E4IZ6+v9vArKpqy2HfkkRlkdzsI03bDcgeQ31TGPxbT
	 6PhcMs+M0oJobSBHPyVgOvwDOEcs2AYE+cR0feHBE5OQm0gtbKEXwFLcvAPFZUzTOo
	 UcIU3lgFugdx0LPbOneqQpwuea0YlCjanRaL4cWYlNe9fZRW7Em60JBzuiSzbPog5B
	 JJrJbeOce1gPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: leds: pca995x: Describe
 reset-gpios property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:02:39 +0000
Message-Id: <20260930150239.CA6301F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D1

