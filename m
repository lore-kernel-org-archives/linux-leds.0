Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55E64E9C21;
	Wed, 30 Sep 2026 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780983; cv=none; b=q0wYoJ/G4gi/FVWZ7aKzTqZhADjvj+NjFsWRnkCstlOX9lGZPEx6RMX8OXsHdrTfeVE9P2Am6huzKiU/mLOwBzgDGmqcVME3DC/y9YLFib0F09SMoFgPiGT/+VWaUOjn0bojdl/DiQ9Ui7pZa9rjjUeyqlC1sToLXNfsyKBo4wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780983; c=relaxed/simple;
	bh=7N4Y3xUQrTUY72XgUbYIvVLxKyb4Uod6+UkXVPXVXcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M5fYKND5k4xpWYiLP8tJIbaObIKZxUe+CXFcAMr/VUv0H0fw9iE0s1IxvHnRHyjFRbuZVb1WmztbZbqJks8wPDCHsqqdphd617k/lJ/0FQkED2L0TJgGWg93WkYtOvVMcCGV7Yp5soRmX4n9/9oejYJ+FiCyf+ykTo8Epa1gkcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RplE+Myy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RplE+Myy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E83D1F000FF;
	Wed, 30 Sep 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780972;
	bh=7N4Y3xUQrTUY72XgUbYIvVLxKyb4Uod6+UkXVPXVXcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RplE+Myyna9uAf/3f0PelJXycRxy46bx2zY44v6PQG1J2XOGDnYu69thX+KkW3ymU
	 HORX5rpPTPX3b2CJl/Wu3TNehvpsv8GdbVUkAwRvuj5k9A1ZTNrv4TFx/XZaoo4cVi
	 544rb0n2pcpZiJaoudSXb75c+MEFWdSmM5u2m/1mOEH9wrAjALRrVd6ct9h1OiKEU0
	 J7ELcXTVd31LETucExI2TFOPfS5E3yeHyKthMtETbco4pyTFf5nF5qHlVAvBI3gumu
	 GrJ2xiCwESqAvn8AkItV7U5QZQ3GbfS97bJPBEqYPGQXdnkCzAgbtX3uMJenB1Rki2
	 nidy2y7iBtNOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/10] dt-bindings: leds: pca995x: Describe
 nxp,output-gain property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <fd684ef359fb96fd24371922eef64bb7685dbb6b.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <fd684ef359fb96fd24371922eef64bb7685dbb6b.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:09:31 +0000
Message-Id: <20260930150932.3E83D1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D2

