Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81D4CDDF7;
	Wed, 30 Sep 2026 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782658; cv=none; b=Y/pQS4/wx34x9nKmQar7a3wpRmz6SGxQSzy/6IMnOkCLeYs5pOg/rxXlhdumSU0dOs/El7/LIM1E1lI/AQpFAOCwKgnR09hEpBwZIzuJhSBAZLB9Glq3hHGQDP4xI2Vtp51o/VJFONdbi4Us9gVjWA8SpLibm70QJzT84XL1ZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782658; c=relaxed/simple;
	bh=0wqZzk5hKbE30ocSkwWWeuurtUw0Tw3ovczIIWpzOGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EHHOJ7FFQgoXWjQsIJwVBU2vGYSA2xjWAnleIFzhQs9z7qjOIQegzH4kFSlX853NH4yUmCHY4YZoa6TP1hITkBZw3AJnHVGE8+zv0a7Qv3fBCxWfSfjrpeRuimVTEo3x2jZNTjgMqdIPvhuQkpYurOmW3hVhs5U7Uh/9+JidcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TU/gqOSy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TU/gqOSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3171F00899;
	Wed, 30 Sep 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782646;
	bh=0wqZzk5hKbE30ocSkwWWeuurtUw0Tw3ovczIIWpzOGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TU/gqOSySfviy1zvvj+P/xQB2PoQHUGoCWlBC+sQ9nrorMoxrJBJZiyc77W6bm6Hb
	 lFOwttxNdPyxLFzP74ABN8IqSRoQ3jil8C9h6nmS2MT/KpnpfqObfTsEpiQ94/jLLF
	 YGwJjVg98EUwDAF2hea5JzUSM8IVS+nWym35O4e89upPPinB5rOpLlgvHZ6EXhl8X4
	 sued47QCR43O7k9j4Thwnx/3ByQjYnrlN4tdw7L+vPGp/V1BRm232jyLhMtswedJ3C
	 5z/gcWL3enMDxITDyOvt39r4ugcTdWf8VKq+Z6esqJV9Sstet451VDxSnDkLKqipTl
	 OZmsnst2tNTpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/10] leds: pca995x: Add support for reset GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <fd45facac5cdf1930f2ca1666a66cd06cd1f659c.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <fd45facac5cdf1930f2ca1666a66cd06cd1f659c.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:37:25 +0000
Message-Id: <20260930153725.CD3171F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
> if provided in the Device Tree.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D6

