Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD08C2D1907;
	Tue,  7 Jul 2026 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450479; cv=none; b=j8VHTnvg5YuiqInN7z7xB3Wo58ttcxvK9uGpilgdZo/+CrHE1Nj6zdwwGMJiNYDpTDMLKqQfhSWG5lyO/I/NIRn3+ZS4IHzkJaEE0fCVIlqzXv3bJczXA+RnYYQ241YzupWX20g7jf9MK6yGEvEYGeYLkTNSyHWRKm4FVXaAqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450479; c=relaxed/simple;
	bh=OtIxh+CY+dUF/Rq8SLgLrMK6IQwz9y5I4qWkW+QA2+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fidZYJsQ7HAa4v1oODR7hCyFMgC/rpH3shUV7MezaVbxcCNqNq14QkTXTl7UBtkCn5eEPXjYMvmmULVpGfryqwtkbU96Z/F2tQjhEG4Z1R7Q4cIV1L7EbGvpS3BAv2zq1aoN7K+w4Kc+h6AUVWmB4EXj2Q4H6JwGMU/CXd2ub3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMRvfJUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMRvfJUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1837D1F000E9;
	Tue,  7 Jul 2026 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783450478;
	bh=OtIxh+CY+dUF/Rq8SLgLrMK6IQwz9y5I4qWkW+QA2+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMRvfJUuz0mpz0N6rGIn+vaMDR+nGv6Y1WhESgNdzGfEppaUvpm5tGADcmuaT06BZ
	 ypgUodtTqtB7O25YwGBsCSf6kmZ+M/Ky7rPOoN4pq8TvbvgLGLIo8tJzEdOaJD6Xfk
	 S8p9bsXmo0StAurlP/H+jwJaRQCBriFhJVFka9jP4+MOeKn5ElotiusS4TUp4lFow8
	 hRyi4lPjgTapBoJiXJ0faXdkOy/mZYN/SARL9OFeE3lwKyHCVNbKNIzHa7rdzkNnnZ
	 GhAYHskQzIouxo0LvSb6mI8eMMq0oH6BWN1OWoDXK9fc75GXcpfsJWalW6ITEQaE1e
	 /fShEKURy+nkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707184437.500278-1-ninadnaik07@gmail.com>
References: <20260707184437.500278-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 18:54:37 +0000
Message-Id: <20260707185438.1837D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Convert the brcm,bcm6358 to DT schema.
>=20
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707184437.5002=
78-1-ninadnaik07@gmail.com?part=3D1

