Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.120.86.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457839;
	b=o1NxiNW7ntnk8XcI6W9wdu4ZWSt7lTehesE03VY6Dgb+APmMTG/BP8+33e+fOpzYohyY
	 wCIkQ5jnokXjxY4qSCG/9mcjA/a8ut1CKjYHErKEL+yLgxoX26EkiXK8OQuo1ZEyFrRgj
	 wfLMg/76lPMPCdi+mYvP39MgWGkD/FFKcOWbtOJIpgamevrFEQVAYo1ex4QCI0L7K8phN
	 G50kYFN/yIUOG0mcDjalCht5BjFu3C+77A3FCYk5VmFWEZgCcUlFF+WYfMuABsiX/hf/h
	 fHqMKkULCPxtUZs0wCEoXrxb0jU5DoS07o68z2aj8Bpx05fNokVjKJCByLeGW4hk6Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457839;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:
	 X-Report-Abuse:Feedback-ID:X-smtpcorp-track:Date:Message-ID:From:To:
	 Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=baFTI7feHfHjUs2Z1HfLPGTNQHlNGEUNjb1UhcudQe8=;
	b=fq4QSpzy2cp705GYfFgyG3+2gw5BKofTrrkLFGVi+NS5jKAvcGL2CovFpNonvZAybl2t
	 tUw+mWzGJM4wfgqZz4vGFmKCuI3QmeOlIFIvmV84dzbIEId+CiZTjRsCj68wv2vspivPD
	 evsC77E07gbMCRpT/IrO7OyykgbB+O0NQQLBWPs+9snXPZf5PVIci35qpdD0dq7yaO1Ti
	 tdwdvN/jaMR17aRzkspV5gcrsyzvX+ufLxjmGv0XmShw6Y/VrvH77YlySzQbDhwBcjd8X
	 AsSC0wLNunhS6JGISmHHKD1oIAV5BWwInujl6GwgrfYhcjfPi1ipJBWhXnF7brq4czQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fkr.dev;
	spf=pass smtp.mailfrom=em1020969.fkr.dev;
	dkim=pass header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=s1020969 header.b="QyMmvi1/";
	dkim=pass header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=default header.b=X5G4kOiQ;
	arc=none smtp.remote-ip=158.120.86.30
Received: from e3i542.smtp2go.com (e3i542.smtp2go.com [158.120.86.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB0606A327
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 00:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDB0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fkr.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1020969.fkr.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=s1020969 header.b=QyMmvi1/;
	dkim=pass (2048-bit key, unprotected) header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=default header.b=X5G4kOiQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fkr.dev;
 i=@fkr.dev; q=dns/txt; s=s1020969; t=1792457832; h=from : subject : to
 : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=baFTI7feHfHjUs2Z1HfLPGTNQHlNGEUNjb1UhcudQe8=;
 b=QyMmvi1/NFc85iuzd0C04qpc3ibgyFv8OGDr34el+hyTbI30rh9ki3gVAANxyWnIKsPJQ
 jbW6woB6RsqK6Vg870ZYbAhUe11uUs7KNz4iyY9jbSVoEsGNxi1n29+GEVjFPf8IN056zUt
 j0/vyA1RAXFSPmnat8sidgVzkzw8tH/3h2zAfiQpx6O0+8hnJHyNJn/iZuRwue4q30BtmpP
 9PujCMWZUrxgyZseUt8Vnvlwzm9ovluwrhFiJ0UIUhZ5+Lo1Nr1pkMgt7naBZOCDebXtkNQ
 zfCgkW0HQJ24ahUKpvGb2zuE7uij3YgnwQB2dYErD3+M8/q1HmTZPuok3LIw==
Received: from [10.244.246.9] (helo=fkr.dev)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128:X25519)
	(Exim 4.100.1)
	(envelope-from <florian.krischer@fkr.dev>)
	id 1xIyA6-FnQW0hPvgRA-l4b6;
	Tue, 20 Oct 2026 00:57:06 +0000
DKIM-Signature: a=rsa-sha256; bh=baFTI7feHfHjUs2Z1HfLPGTNQHlNGEUNjb1UhcudQe8=; c=relaxed/relaxed; d=fkr.dev;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@fkr.dev; s=default; t=1792457824; v=1; x=1792889824;
 b=X5G4kOiQaw0oaWEFVOVcN8ACj5el/tE15KiCmx5ZmF7yp1Y1qajbyAJEPkpol0Zi4Sn4Yqfm
 L2HfKgXtNB5ChfTtM1CH5qd5GYisvgI9OSrkbowFKQeVZ1VJHvbEiFgCl8OqYPTMK+08+sxKgEA
 e7rd/f+ZnnyqRl9kNPUOQ26jr5a6XXaAsqqiirg4B3NzcZzWCau74dg97dlR0vE5cFL7qxZ7Y2U
 PBGn3KJRVR8qMQPV80hFuvk2ijpXtIEQZb4CpbNEptimpTHkU3JcNOgd3bQUjwEoDDcJ1JcU41I
 RQ8crMwUucd7sO249fwKG3ugn+c9wOUG9v+hGmYbCY4lg==
Received: by fkr.dev (envelope-sender <florian.krischer@fkr.dev>) with
 ESMTPS id 5b88a664; Tue, 20 Oct 2026 00:57:04 +0000
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1020969m:1020969amTSgpp:1020969sMMvfpqAzu
X-smtpcorp-track: iV_ZDZKnEBJe.EOA0vGa8enFZ.nzSLpA1lU5y
Date: Tue, 20 Oct 2026 02:57:03 +0200
Message-ID: <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
From: "Florian Krischer" <florian.krischer@fkr.dev>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	Michał Mirosław <mirq-linux@rere.qmqm.pl>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested the v12 series on an ASUS Eee Pad Slider SL101 running Debian 13
with the 7.0.1 postmarketOS Grate kernel.

The system booted successfully. The EC identified as ASUS-EP102-DOCK,
firmware SL101-0202. I verified keyboard key events from the EC keyboard
and touchscreen contact and coordinate events from the tablet's maXTouch
device.

Tested-by: Florian Krischer <florian.krischer@fkr.dev>
