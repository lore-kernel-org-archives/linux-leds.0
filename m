Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265CD41E6A7;
	Tue,  4 Aug 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876666; cv=none; b=Zt5nmR030EqOu3xqalIXXnk5gli08k9BXo0C6HRaGMpH/vYn/rK4Wr1lJptUJ7T8DP1dsyt69yr2KYt2PwbTsg/9fxQguQ5prLeTsUgCxeQ/2hFI5y/7Wlyz9nDDnn7CUIw190fdrdz2GENVYchL4GgvA3kS4/hsF2aiG4Gu7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876666; c=relaxed/simple;
	bh=gsDh9izgbL9hc+feYoBr/YZgMBuKrd1ALi7tezJ15Oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bSEqNxBmNpiEwQ3hBBSWNweE5MfFg5QGgpzdRkg+IqA98wlVQuLcnFkW2u/DGaThF62F36N+T3JgCRxDaDfRK7iH7cmN86J66wm25h8SpMBQSwkVPeAEpwshN9k7HvWZUMkRfkZuukHs8FsppGXqtjnsyqc9UUid6RC6Who2BZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVAApjMa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVAApjMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B4A1F000E9;
	Tue,  4 Aug 2026 20:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876661;
	bh=gsDh9izgbL9hc+feYoBr/YZgMBuKrd1ALi7tezJ15Oo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IVAApjMaP7QjtBeqW8UMLzIEodfAihojjtVyFLQtBigUPSc05KUwhbnwLwDHOMImc
	 iCIZLJFDZuChRQ4EOQBG32hdXk/zmEZZvQgAOH0FRQkz1pVS6mTYV1lOSy0cJ5mjPP
	 f7G3rE/1dvNdqNrLC/WYhZMrLCPsuhp9selwOueDYYhz8h+ZzuFa02IWUMR8BCHLUX
	 620Wf9dEueaxiT7xBLhQ++q8YI57TrZAlqPudKDXg6lI0uxGFfwaCKOFCkgyWDHm+x
	 pWzBFJwWl8RKMBRQwFMWeE0UcfhW9DZoI/9Cs3RN6j6mGEtMMXozfGaQ8tdyXjmYLI
	 BXqysSJKnETPg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next v2 3/6] i2c: mux: Propagate software nodes to
 channel adapters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803205011.1249-4-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
 <20260803205011.1249-4-ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:51:00 +0000
Message-Id: <20260804205100.E4B4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Device Tree channel nodes are associated with the adapters created by
> i2c-mux, but equivalent software-node descriptions are not.
>=20
> Find the software-node child whose reg value matches the channel and
> assign it to the new adapter. Keep a reference for the adapter lifetime
> so downstream clients can find the channel by firmware node.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803205011.1249=
-1-ahmadexp@gmail.com?part=3D3

