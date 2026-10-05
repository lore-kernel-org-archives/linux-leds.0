Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998F4A2630;
	Mon,  5 Oct 2026 14:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210239; cv=none; b=Pw51Z6wP3Pf4Sz0a9YTmQ0HGPMsW6yPFewCVTSJY4msQo+rkjLdnQ4dcQFJfBYM3Q0MQ5LhmeJNHlH9DYa3xKLZEuOAJ45iEJW4ZnHM3m6UvfKEBtmFRxhOJJwxwzVSEU25VucHzI0YydCoTFij0KeQBNUfRYE6Mb+eljLHQNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210239; c=relaxed/simple;
	bh=O3EYBrrySBN/hXk1uhvgkNFbBg7wQZ/LvU1h19TxLZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q7UBPAaqtWIg07r4Oygfotr1uF+eow7Slxd9JQ74HFQh0TRLABdBJUoKva9/eicnbj01CzQYVKxvw6WqUVLD4W5baVEeIXNxka1erMm1sHX3eLxtsi/UL+LdZURHH4534gjhdnME3qgXuKAmBJQn7IISMxNB2NiG12805iYZdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxnKYRLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxnKYRLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BE31F000FF;
	Mon,  5 Oct 2026 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210231;
	bh=O3EYBrrySBN/hXk1uhvgkNFbBg7wQZ/LvU1h19TxLZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxnKYRLBRsofx0m9C/qDzN1ox4JR8GSa81vfOjGHgJR48tVrDE5+npIgqWIwzKjdm
	 vPPYJk/CpWlSg7ws9AvcBoTobyS2/xqOosQCLicM9FvxkIR294RqmTMHhqTRShU5Hv
	 3hclVYf4TJZW+pjXqjG7zMI1Py9lPXeBEMdSCSa7dhNA3rC98i+0nNASQXk8A36TVc
	 V+h4IiEbnYENU+JCHzvVCSQadKdU6RfTy4SLawtevtgVYl9lCHvlXNipshoavbE7yN
	 UjU/BV85qZx3wPpEeOwa1kz7eVmtcVYlyoZyK7qbHJvasm4NbAJEhCZ4Qea4H3piXU
	 aGb5c8Qkq4Smg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: leds: pca995x: Describe
 nxp,output-gain property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <fd684ef359fb96fd24371922eef64bb7685dbb6b.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <fd684ef359fb96fd24371922eef64bb7685dbb6b.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:23:50 +0000
Message-Id: <20261005142350.B4BE31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow configuring the output current to adjust for different hardware
> designs.
>=20
> The output gain relates the output current with an external resistor
> connected to the LED driver. It does not directly correspond to a
> meaningful physical unit of measurement, so we refer to the datasheet
> for information on its calculation.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D2

