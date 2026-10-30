Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368468;
	b=VYXeVi/znbJ//7tTaVODJ26xSVImEe7f0j3d45MDVe3NCGBIWaE7epObuZzDNeh6VM0Q
	 JCFLs/rcOMax2vEIPOh0vVpcVS8SyZri+SpakGWJfF+/mMZ5jOTFdszipW6mrc6JbOned
	 4t/OupvaYWd+q4WOUI1vjvX1IHZfTAotGilVwhBv/RAnARZPNNA9yFewprh4TSPjZcitN
	 XVNXkJTZrqzsq4/ZHfr1yzXkFG+28E/Qj7Ck/5IKwUV6Rw3DOUzospCLNkXzSLf4EkQZ9
	 uuMCRxgx3rI3nO0tFYiStWIGb0uRED6vEkxuidVQzc2C49nzrpxExg3aKGiT5h+V20w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F3LGRI5FrgZI+Axu6r/LAQRULq44LDdg4Y/Z57+wGu4=;
	b=dgFixh09Wlh896Hs2Tz8Li8R+HI6pdU7yTH7ZFlYqWS8gxp/7bNQzvaHibI3DC1vs5Nr
	 iHEjvX83GWPoDiX9MbvbnPBWmw9rl9Xh2LqYdMz0roByIz717iTj6H4dR1kmz8VE+F8CI
	 VCdRtl6KyraYxFDcPcNZu1gR2wCTnM0mlhZ62eQkbwLVa6z57LiSQsgX7Xbj/tG1V/6a7
	 cezP4pT0Wdm9sodmFmdAcOvvt5uFL4KijaHIMfnCgBntcHyeZOo9/hKuTxMX1KzlQyLnc
	 oqVmii1/LHDpyfRBejIoXBPMy8ZkuyM2fmpzIVR5FOkxMd+aCvIsK6u1dmhVjaTfN3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndlyaACs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23B606A31A
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndlyaACs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2999C1F00A20;
	Fri, 30 Oct 2026 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368467;
	bh=F3LGRI5FrgZI+Axu6r/LAQRULq44LDdg4Y/Z57+wGu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ndlyaACsawFjB/15sNxh6o99NfKCcOHN0iMccF4AlkZbte4AGrFGF2A99WQ+f/0Ew
	 XuvOhBxGlX9ZBRXqTamd/3Oq/tIuJHFBxWX2Sao7zxSUADqIknQ/e8ep5wA+CJc3Cg
	 QzlvRLtkNLTOp2ydzQrzRAby7ASZ5lXwhsRsFH9nrlGaQsB6rNhffIyyRqtM5A/eRi
	 pDy+n1cspKffndxbsb+njT3gRTttWIwhUnyjLlFLMp7m46T+zZV2Iqc1HBLLie8hKr
	 AKP6H9BrnC3K1ODRNI2Tpuezg6J23o7wYbCuON/L6glFk4Eoo6p2VbEKbV7/aTtfgH
	 2esnNMIHthJDg==
Message-ID: <sashiko-outbox-191083@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] leds: triggers: Add led_trigger_for_each_led()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261030-leds-input-events-brightness-v4-1-5ea0ead7480c@gmail.com>
References: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
 <20261030-leds-input-events-brightness-v4-1-5ea0ead7480c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 13:54:26 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
>=20
> led_trigger_event() sets one brightness for all LEDs using a trigger.
> A trigger which restores a different brightness per LED needs to iterate
> over the attached LEDs instead.
>=20
> Add led_trigger_for_each_led(), a wrapper around list_for_each_entry_rcu(=
),
> so triggers can perform this iteration without spelling out the list
> members. Document that callers must hold the RCU read lock throughout
> the iteration and must not sleep while accessing the LEDs.
>=20
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-leds-input=
-events-brightness-v4-0-5ea0ead7480c@gmail.com?part=3D1

