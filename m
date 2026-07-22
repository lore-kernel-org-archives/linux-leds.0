Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502B4C6F08;
	Wed, 22 Jul 2026 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715448; cv=none; b=aq7iuozZaA3hl/dCPgHBPuJZjOKUusO27j7PYuLYvO/3nwOdjIMZavtHBnPtP8tS9rv0VpTk9PaQfhAET+fgeOrx7K3nWc8i/luIJMZGuts1a9JvdYXck+jDrjdnkgT/3MyLR1Ct3ZNkqfY1NM8ZKavowkZNza6+OBzoVaQx8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715448; c=relaxed/simple;
	bh=M6JxxjsQ+mHDkV1NMzQZovrgjRthOQNXC0dEAaFzhpU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AciublTgvEnSMWaRbO+HFETnPidzWZOsp195eAqHcsJSH+QBde4pjMmnx8/8sB4QQyN8HyjP8LsuuOiNWw8Kphu+hF5CAC/6rMGFXTETGJdUf+G49m0TzH9RRzhRKVT5Q8bKDa0+ZXvPywZX7ZCc42FmxNor5+tcpp0nybtqun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=josDyg7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="josDyg7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939191F000E9;
	Wed, 22 Jul 2026 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784715447;
	bh=M6JxxjsQ+mHDkV1NMzQZovrgjRthOQNXC0dEAaFzhpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=josDyg7sFchp5Ia07fvWoYcBHPL26nN6nKqWsPZ3VNLIOEV3yDNGSwD21ttQFlVOp
	 kxYTJ5N+zH8PlZQ85FsnmjhH1Wm1VYUxKM7Kfph/NBg8RYBENbtydLLgof3x+PwDPz
	 lx4Kp59Fs15C7xbChYn+Y8fmH3AI3R3gvmcbYhRaeaZ3Rczi+VrmooGs2HXQAArZpc
	 zr9+4k+KBmXlerD44U94q3vKYg/7hj8uvIXRcdRt06meFHp00ZfpXT293p8sM8yr0K
	 amAlj3HV5/y8JJjqZOUVqINSkKNKPO2WGnNEOAyNXMMVBkXoU9k1eQXzyGa8BQIid8
	 hcl+nR/r0bhGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: fix typos and brackets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Ebner" <manuelebnerli@mailbox.org>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260722101246.3113818-2-manuelebnerli@mailbox.org>
References: <20260722101246.3113818-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:17:26 +0000
Message-Id: <20260722101726.939191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add missing '(', ')', '}'
> Remove needless '(', ')', '{', '}'
> 'lover voltage' -> 'lower voltage'
>=20
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722101246.3113=
818-2-manuelebnerli@mailbox.org?part=3D1

