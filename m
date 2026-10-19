Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4874E80DA
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409196; cv=pass; b=L00Q/yb3l9OH92EVpN9Okfr2SWJqDhu3dxDYBJJtwBY8YyGabdi6//m7anQ5l3CCPIBDTcEQ44AoV1NQ4EdZSdD/jFlLqP+rpzsCu3LCyhlSRm8VRhRBVLs94P7NXEbsx5e/3fAUgDbHJRQCv8QssUJboTk0Vb+3UZA5uMekWAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409196; c=relaxed/simple;
	bh=NjvtDbKF6HXkZCMqwsd9sCUJNo+Nw1euiIQvE/sseso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3Hk+a4mAJYUTjlXccuKCrMf0hhtRLQPlwxGhJEIFx7Pz+x5MK8EWnEUnQzVdUUUdpIo4injZqmNWkXHokOKXsegXetIMasTzx1ynshz0Ef4JMASJv5h2w+yKlMmQlEMSpvpcTdIeem5x+gbx1hRhCKtCqV2Gp4+gdd88+fcumk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lD1QQ9YH; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD1QQ9YH"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6768403e9bbso1376943d50.1
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 04:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792409192; cv=none;
        d=google.com; s=arc-20260327;
        b=eA/vojdvRGNEi52SulHSoNupTJuU/QK7HL9mZ1HSNbbnY6DwzaY6KahzPAf3/5uOt8
         yDEE8He8RLlmFKW34/s60hGZDlqG879hmIAyNMHnGpJCFakNS0RKW5gFevP+WgoFhL36
         NP55Va7PipTTd0frl8a+5bOjJJw0pFLbjFWK650YjDvubFb3oG7p3od08A+mivkCItAI
         n9ToXctMiGHNIP8mNtc1Rl6z37hVDo7RRbinOV8iVGWo5/NPLcjDLo1/xrnEjvG3BVdd
         ugKcKAJaPQMef6n7otdEIsmQpnychCjep1Wj0koPzEbJrParm+vYNPeXoIj11HCM1bpm
         Nd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        fh=h1pARgusayGh0qei80iv8YqtdZwHLiZs4ppI6GNWrpw=;
        b=TYI0cb0xq1GO2hHAVG7kFfkUOPsGZj3c+6aCED4TQo2G39g97PkxKDn15oNJl2gEhS
         QQluT/8MpeTnxXxiUfBVOp1jc33TcAz4gwFZ3mjTezupXeN05JRlSVthuEThJ5wue9yR
         iHxno+Sz9tS33dt/Qd/gJaq/Tk02N6j0T2UWJovfRO0MUObyMBITDcKerf+ZNn290F/r
         R+N9fjO++6czO5mVq1PJ51W5x94ivV9XljxXqy4v4dTBlxoET1DxQwZKYxlG/yyLVSKL
         6cmgkZ1VFf4oujHDRatJESWrVI8M2Cko7pBzlHloxcicQJcIj0Dzu9gykdGQghptadn3
         A1wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792409192; x=1793013992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        b=lD1QQ9YHwcxcfb9TQhswu+Ci+TiBOawx7r4a0gt7brNLXnxv1n4k6CyoA7kpBBRiJZ
         Nxuoc8vFMAXptnwT5IHq+1/1YL1pn4AFxKwOdYAl9qYWvSaO43e18c6xnZgsbxfDVvcJ
         7lDPWKrVPfESajInGUBhgOoDZzqrCZ1fK8db5DJKyakEmX6b56pLAkn5f6rzwLUP4F0E
         V+iWeSrJI3lDp2o0pg1Nz8Qw5CwtsQX9EtAPtxDTU+Zyz815yiYCNP4tVZs3HXs/VWJs
         O0zvk5/j9JJRfs4rKiEGA90XXJwVmodlm4RBfBmdz8O6MVhbljztZ3U8BV2nmKA5Dr0K
         OxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409192; x=1793013992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        b=TgMHZ+AIhGv3KE8Yvxip/PFyYhlcy3G7UkHyKhUt0rgQVYiwakRuw089iAFHdLK1mY
         83la8sMFnqopu8Z0DI0q+pswjq3DdUgTvdMqG60Aa0bnqYGNuEKLWclpXZ2h3BON4sHx
         vaLsQzA4d7sVQp3jb5a0ElMCyn7Ee8n5prulwLelr/UZhOoyQsmByVfoVfudyzNSX0DG
         1A7tj3VoWw0pHquxXg08NTjaknPmXNIzfrBlS1VxQ2J3Pk5tKUTvM42wGmK+gEwkWW9u
         a9V560dmK3igrAdZO4TxlYS85qC8t5rAnhOPIzZ4Yw1AN5nf6VQx++r7JW4B408C0FS4
         TB2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsYulsX7PijCzRhpPU2PdAKAAgqdPnH51LmmERRWoz6onpMXvTwr9D18s3wuRfulkJ22a8QbLkgmgq@vger.kernel.org
X-Gm-Message-State: AFq9FYJOk5lbGDTDOIYSkW6lSP/2NEyrqfj1M75ld3A8Gcgdcg0tPKSR
	nfzU7INkuwy7XrnIMvTo5Zem8lBM+fPpavMB2ybpqMTIoM49i5dhDGAT1DbTpvgF4GlPRK0zPqQ
	twt19vjIBuFCXv7PAN6QOFs52bRIXpLU=
X-Gm-Gg: AYBFou23Xoan9xE/2wLFSPptrraP0dbyL1CXr3yPhFFd8hWvRBMzXKeJihhcNVvbYB6
	VtBrneUKoQ44tXVNO6DGwxS8h0BJ0Ougt2F3qgKmqeGQ/0zKRXdCJY/jkh8MRSNS20I01yBUX4y
	MMXxqfZy0d0Pxy9qZxV01cZkrN2jHrf2FimRBlcOvBfwfmsy3CmnZktin1TH3rxCH8xAeOxwfbm
	oqOfp35Ci+RtreirBIpkhWMEoyRwWziwZ3HKEFc3SqdrQKfbdt3Ki/vKqkF2ZU9LBZuFBJqy/Ur
	dfh6t/R/tqMvVl3+lWVjh67WajPR14gEm/HP4JkkahRBghqRW4gQaYAjGKzDuKvNRA8NZ8Fb+lj
	SDbWlOkbHHbWdV/i2SYuAG/jso958rgxq74+m4rFKmHv8FWrE7ihegt964vkZcHe3tBfdhA0q7I
	UHe0PLSQ==
X-Received: by 2002:a05:690e:1347:b0:675:66f1:5ed9 with SMTP id
 956f58d0204a3-679ca90ed21mr2347287d50.101.1792409192148; Mon, 19 Oct 2026
 04:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com>
In-Reply-To: <20261016162912.64581-1-lukapanio@gmail.com>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 13:26:21 +0200
X-Gm-Features: AclHuK8NAOp_nRQSq-Iz-AG3DYdUQ7KXnVtQSaGV8OFLCu20HF33SdrAf0b1-9c
Message-ID: <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] backlight: Add Awinic AW99703 driver
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	daniel@riscstar.com, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, junjie.cao@linux.dev, mitltlatltl@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Krzysztof,

Thanks for the reviews. Before reworking this for v2 I'd like to agree
on the approach.

Following Daniel's suggestion I'll add AW99703 support to the aw99706
driver using per-chip data instead of adding a new driver. The register
maps differ almost entirely, so most of the DT properties stay
per-chip (dim-mode/UVLO/ramp-ctl on AW99706, OVP/OCP/inductor on
AW99703).

Following Krzysztof's review, the AW99703 binding will drop the
ramp/transition timing and mapping properties and use the standard
led-sources and led-max-microamp properties.

That leaves the one common property, the maximum LED current,
spelled differently in a single driver: awinic,iled-max-microamp for
AW99706 and led-max-microamp for AW99703. To avoid that I'd like to:

  - add led-max-microamp to awinic,aw99706.yaml and mark
    awinic,iled-max-microamp as deprecated
  - have the driver read led-max-microamp for both chips, falling back
    to awinic,iled-max-microamp on AW99706 so existing DTs keep working

Does that sound acceptable?

Thanks,
Luka

On Fri, Oct 16, 2026 at 6:29=E2=80=AFPM Luka Panio <lukapanio@gmail.com> wr=
ote:
>
> The Awinic AW99703 is a high-efficiency 3-channel WLED driver with an
> integrated boost converter and 11-bit brightness control over I2C,
> optionally combined with a PWM input. It is used as an LCD backlight
> driver in some mobile devices.
>
> This series adds the devicetree binding and a driver for it.
>
> Tested on the Nexphone by Nex Computers.
>
> A board DTS using it will follow separately.
>
> Luka Panio (2):
>   dt-bindings: leds: backlight: Add Awinic AW99703 backlight
>   backlight: Add Awinic AW99703 backlight driver
>
>  .../leds/backlight/awinic,aw99703.yaml        | 131 ++++
>  MAINTAINERS                                   |   6 +
>  drivers/video/backlight/Kconfig               |  11 +
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/aw99703.c             | 583 ++++++++++++++++++
>  5 files changed, 732 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awin=
ic,aw99703.yaml
>  create mode 100644 drivers/video/backlight/aw99703.c
>
>
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> --
> 2.55.0
>
