Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602587;
	b=zcnszA2oaErZyTWWw1qsQwN5ij6qVu6o+R03Iv8cZaPT+5VKPmNOGSQqMAXI+I+D6xfS
	 lljHm5jWM1h/HhtppjaYnniJ2vhuyDvHBzd2ImSoLUyAB9MtYT8YFA0g7BnvqK8Bay2qn
	 iyS7l5qAZtTrsQq+ug1Ul2HalxlJFnvHfq2Ih5rPmMvwWvlxyt/JPb0LD0WRJg1EQlGKg
	 qBowza/XJXbCXyK1Cy3kH2JORL0LwCROSOY/4DGhvr5X5JSRHANDbwCZy8C+kNry33CIx
	 iCk3QGbkxPr1KpmDWDZGOUpOOCVuk+Hc/AV1tU0GujWeFPrvyqZkXMZlpo0uW0bzNYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602587;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AQkKWLz4U0E5Oh6DuoTAxpSIFcUa09/j0X0nfjwcYJg=;
	b=VbC/vQca16G36KHeM/LHFK1GCgVJ3q6ALI/pxjWqzg8UlrOuBncexocF+HJC2ZbwV3DR
	 0L+TFTu/xrSwVCLGaC6ASYDRXvRa3gdhv3W+8O0tqxTeyoNeS+BmiT8gB/jTpHZR5xOcF
	 e7zGoO/mlBC4JFFfNh5tVguwXFcoVoSJln2VZ+C+l/DQxs3uociHfRMsfcQVAz6kbbCVG
	 XVeJdDLLY3dpRWhG48Ow2+89hKBAPnmpmcgProdnn6ScWkyQr6z6jRvRk3pf8amW0Zfzz
	 VhyS0NhOjrGN3M/dGhpb68/Ju7A/DmvDFHMjbcSbi7hGLxKRTK0Qif92uJAp2gPmUow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNFTHqiL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322F606A333
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNFTHqiL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80F51F000C4;
	Fri, 13 Nov 2026 20:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602587;
	bh=AQkKWLz4U0E5Oh6DuoTAxpSIFcUa09/j0X0nfjwcYJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cNFTHqiL6L7R9F7XvxUXsL2Uj07jpZK0N/8Axe7mTs48EX3PgE51gcjrJqliAfMTk
	 OYLmG3M3ftVjsJ2U4uYZmdBs7o0h4RwUHl+cIvvqxjidy2AURiigjwcT4At7C94qJr
	 2r1K8zoONwjUfGSM9+6Cbzr1yCotqr/sz2Qg3lTo7ZPW086JyUDat50zpfK+DoJMWa
	 s71rLSBvJmORmorz0/Iaps5UCDMPf0+nA+P5Shk/M9L0td/F4sIPN45CQmblQeaneN
	 aZjrsIcanPAS9BhXrU8V7aORbl4gcpLBBkELALOIVGWF3Tq+zi2Gj1URWmEIokgdH4
	 SjIdQnNMEKPPQ==
Message-ID: <sashiko-outbox-213673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] leds: trigger: netdev: Report invalid interval
 to user space
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261113201936.2645736-4-alexander.sverdlin@siemens.com>
References: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
 <20261113201936.2645736-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:43:06 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> interval_store() silently accepts out-of-range values: a write outside
> the [5, 10000] ms bounds returns the full count as if it succeeded, yet
> the interval is left unchanged.
>=20
> Reject out-of-range values with -EINVAL instead.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113201936.2645=
736-1-alexander.sverdlin@siemens.com?part=3D3

