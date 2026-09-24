Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3E3DD87B
	for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270452; cv=none; b=OkH0p/GcXoBu9fEUZMeApTGvMYV5/xaVc+783ufDsQ6hxfsjguZg6+5Zq1eCKOomMlFSoCz1/AjfLV/uEKWZIkwNtwpbyyN5w8csM7DB8r8i4moIboX6w+iE3Y4cfnUSVvRMaBw1b1XQ7paUv/7IzZ2KDFr9Ajf1RE15N5c1vbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270452; c=relaxed/simple;
	bh=WJ/jvuEsNTw48GNguN8zrKKJvyVSevOBTt7qy4g+rxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufNR6JcddT7IjNOXHVxyktSW50qSM0c5E42veNlc5XfUFVEnTz/Tuqj0d2cF9kW7s2/X9mDqn6IMRf9vluFkNs2OPy7Juhp9bvPGu6QeqyUcAIHfCEFE3UVA8wyBI4wNIZyEH5x0Yu3IcARQVOhLjgqhGZJto7voBn0Rn43Bwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV0fmUx/; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV0fmUx/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so58331e87.0
        for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270449; x=1790875249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M39j3RN/o0/NumnXpt5nKH9FIQ/d20wF6j50zvt/Yc4=;
        b=QV0fmUx/1ywrinJLDPCxI5tkg1ej8HfjAr3FaqfWz7No5GBtvZ7SyCQMxwhfYoFg0t
         hPxFwty/yIZUMNiSbNw+42tqCjkW9FUTPa7qBge5Lbc2BhxR61JUphdEPDv2JLDgMKO2
         QzDYyGznSK2qFFFpYvKUkwLFN6Hmhtl+MmUhEKMeIt98O367p9j6P8uAys3PVXXpECAV
         MV0/m1sdEr/KgsqIbPdV+SEr+Fyqppb+YIC5aKzTTAUdlw1KBYYyiZE53KjXZgQVmK62
         vUaQaDSUcR1D9Hd4wAhWkoB/WNAl+2Lu3imOnltkVeK+F5LRUJ4oMdSTdQwOrggaAbJF
         pLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270449; x=1790875249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M39j3RN/o0/NumnXpt5nKH9FIQ/d20wF6j50zvt/Yc4=;
        b=NRiXC86H8GOoRSTmj8sOcmwAl2MzT72psO4lzHBlo2godmEt0K6okB3dfOwlVtODFj
         c/jOfuE7XbJLaqEO5V0oiW4LXr9/RPREkj5wtb9M0pk8UJ2onqei76XYKa1mI2Ok4Vha
         /BsjdYlBm68y3LQRf4qaYsGaweH5r8+AZw/U7cZdK0yXC5CSHfZ6vgYbb0R4FjRiudLd
         Vs+HKysMeD/nGgyjuiD1bIsPi/XuVuAUs6Jw7L51LMntSsmIANCzBTLkwCG2apTtPad8
         ZvoZxoyE5k9Cvgte8/VYTlcSTe0pOFMMUWFy7v6UgWl60f8Nz+0iUvRhC+YCfFcZdPsM
         s49A==
X-Gm-Message-State: AFuF++m/w2Ukw2MCKL035fJgkrbdcnSAGuiCwq/l/lFhWZMYomebXhV4
	/IFtVLq+jyEdiBGfVI9iIMfTdN2DkmTN2oSw2QM8CZAdlszvbqosi6fJVU8gEtxkKMjokw/Lq7U
	=
X-Gm-Gg: AYBFou27QtJtOZXXeTwXnarvs8Qgc9vVs+preqbsKWLFc1q9jHJwC/Ah3C46L9bMlDC
	iVg7AVEVLlS59fjgQOdNAPcxtKaONq0FxE11qGR0gbecb83ImYkgqggM28fBLIL68cR47rS27KK
	dgseaFX0k054lEIuAU/AHC+38OnRJtO4QSl0xXfQfMsxVer+HoS+WA8RXbubCpY6q7y2Hqjrlhb
	JGxMwSO835UBN/O3oUO8YAtJAsmBnSFvU/q0za/2b+QU37fBeYqGj9cKjPJqeg0oCj/RhegO1tF
	OIlxRqAsYwy8CdxTPyJ6NYDtjUQIhHsd08jCxjS6k1Kpl9aXozfx92jB3wSD4NKFliENN7xrpZx
	FP90sDUP4+/L8Kg9bvj6C59EJPwehTCRtpPrGybp+n9Lb/De9aT9ZmbJ7epuuJ06zG5a+YlD+1b
	O5CMnxH9CBwsKEIOlxOl0tDZqfiu1/dYoy4a3IHjhA7u+YfaSzBpX0GspgaOpyclFRW5WzIN8La
	SbyvW71dCiRwdU=
X-Received: by 2002:a05:6512:3e1a:b0:5b6:183c:5c86 with SMTP id 2adb3069b0e04-5b8e0a086dcmr1008333e87.36.1790270448439;
        Thu, 24 Sep 2026 10:20:48 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859505csm1611065e87.74.2026.09.24.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:20:48 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	rillian.grant@gmail.com
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 0/2] leds: flash: lm3643: standby fix and ACPI LED description
Date: Thu, 24 Sep 2026 20:20:38 +0300
Message-ID: <20260924172040.1185688-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083620.68324-1-rillian.grant@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These apply on top of Rillian Grant's "[RFC PATCH 0/2] leds: flash:
LM3643 dual LED flash driver" and answer two things from that thread.

Patch 1 addresses the two state-machine problems flagged by the Sashiko
review of the RFC, which Lee Jones asked to have addressed: switching
the last active output off left the chip in torch or flash mode instead
of standby.

Patch 2 addresses the question in the RFC cover letter about supplying
a default configuration on ACPI machines, where the chip is enumerated
as TXNW3643 without LED child nodes: it adds a DMI table describing the
LED as a software node, starting with the Lenovo ThinkPad X1 Carbon
Gen 14, where the LM3643 drives the Windows Hello IR flood illuminator
with both current sources feeding one LED. The limits are 100 mA torch
and 300 mA flash per output, well below the chip's maximums.

Tested on that laptop with Fedora 44 (kernel 7.2.5): the LED appears as
ir:flash, torch mode lights the ST VD55G1 IR camera's field of view and
the chip returns to standby when the torch is switched off, and face
authentication with howdy works on those frames.

Rillian, if you prefer to fold these into a v2 of your series, please
do; a DMI entry for the X9-15 Gen 1 only needs its product version
string.

Ruslan Koreev (2):
  leds: flash: lm3643: Return to standby when the last output is
    switched off
  leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

 drivers/leds/flash/leds-lm3643.c | 115 +++++++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 6 deletions(-)

-- 
2.55.0

