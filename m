Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822018;
	b=AV+nQ3Arra75rINXyJWkJSPxl60+3zes31QHUGTzKu5Ho985yBXuMWtNFoW7PSrohsI+
	 9nLkBf7kzimBUx7QKm+/+FTVsdl4KZ0OJeCflBDnf4KLqSegMmMhW3AQdGohNC5ll49LY
	 RdEUvN5MA6liyY8X6kWW7uMQ6EFwPSPoMfDQm3TAQ1/iSzJEvIaBXJkk4mxA5+4OsHPjS
	 OhG9S2smxViteb6d1kEtKSvbb4vHU48llCrZxeffJPsWPkS6q/ruo+jQC75dgvKuP3Wjk
	 6Puc7WDK+a9XIfPRiI9giO+xIOWKgwQY17S2qcG+/T7mYigl5H/M/g7FLTBVutJkR7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
	b=bqzgLLPK4XVk3m2sD6CdMBDPypb5X4soOhNXgxL9eLK6mWJ/H2aCmXmIHYE41gsdqALT
	 m4b8kHamktB/1I2zweJ2YlRtfrRLGfJOKn5q0603X2xC+EPNGlEhm2fH6I8UpoFT4Y87N
	 8AoEcXkwo4nju6vM8t8e/5JP8qYxHc+z6ni280pbIJIxI4wE6iM7NErIP7KUxvsyisuwX
	 9ObgOJoB8K4m7S9m+1rWT96DD0n4C8DSKyYMUNsUufr4A4+JtBKsntjq+D+dDfgXvRP4Z
	 NOn3p0hlq/PLu1g3tALJw8Hm7PZkNeqjID7U3/j/CilPrhxyYO6Ie4ByD/M/HBk9qKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F4E6097651
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F4E6097651
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so1943071c88.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822017; x=1794426817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=snwKVTUy9LvBIeZYEhCXzEnRQp2wodIFGKY4wUJ7ztWzLVbTd1bI4nr3mGXqrQXFPO
         83/HtfEisb8NH+6TKxRanc+LHldo4EqJ43kuJQJyWdqbEb2qaKJ6REpFD/Jt5EslTB+S
         zscnal0Mvh+NX91kiP+siOH9v7tqEITC6j8TarPFAWvrj5zWcfX48CLTn8neQnUjk0aG
         DdWT6beozrR7hgNmLfQYYUBVHi+K7i2h0gb1c9TLmiQO015gt7sDVMBLhaHB5Rgu8J3E
         vDvOsMZkyxTj1DF9F5rnA3mHVh2Jx0j8rAylzbJGVo40aem9854GCIhJgMsA/lSZgxl8
         K73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822017; x=1794426817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=O1RoPZ5w+c6/D014gvELmygHf9F4jlOLDxZMST2hMeYf35ogTeU/PcbozMMtneDXc+
         CU4oLwM5lL6sq/OzBoIFSwZe52UbKCmbMb4M8WJEKx9+oTMorylKWZ1ofogzTkHMCV+L
         gqouXLyhiHC2AlN2++G27YP8ZBNCqCieWOK0xxW3OjUpnUXlRS4pxAgrMedKcaLYnFWB
         o6LUa0MtaG1T8J5/o5AR+2HCsg+Vj2BwKaG79dX6Z6ts+9JdiJQtZteUMcho1OfvyEas
         o2ncMMbF1W/lIW5vn7StYM3KjAaDYlZ4lSPhRksvO6/rjkt2XN8WMmkVyOy8Vrgwe/x6
         uLng==
X-Forwarded-Encrypted: i=1; AKwUvBzBqnWYTa8w+57+CELJyNpc8JXP/yh5gRlt6obqQe4Shg00RzB5JM3PdyeJ0aXJqQNjp7pbfqltEWxo@vger.kernel.org
X-Gm-Message-State: APuU4Z/Jw2rXS/i34UmVdqeJ6nF+xOjvu5XkE7RbP2PwQXVT6rIC9M7+
	DNTESbgi81PgkpvsIiIvwgWPez/TaBH+7akAY/Fvqlirs+BWx8O0NGQ=
X-Gm-Gg: AYBFou2BPj2H8vAjXrJ3xEPC5RjCFqfAN2UCsrjSlqR8wGDbRsPUo8C1N/e1rGwGryy
	diWET1tzCqkNHB14unYtHHw5foYzIV0W8jBDBQ8wfvBDFj2hlDGbG7PYJt7AE2jMRGOEvC5tQl/
	SG1shtMCVEbjIjmP+Ok+9+yTiGauN3TT7C/NM+O8dnGtWY7WyaiguJ/zdHrLyr7dxQEtR+JYbBq
	JcL2vIOb0C89cOdKkCqo36ISpejOOZ/1bn+o+UNDCYeIesuceJ/YsMwYFr0uJhB7t8cNeDu06bL
	YNLVWn+Ym7Eough5z5thMC+42Uw+H/6jd2OYS150equJEberLjrYmWL8mKyDGgjSS+koWvPrZul
	TuPZzvQaRcbYGfIbXJAXKWrJd2NIXMkffyIUx+4gBBqE+ng59hpHOgivIo2VpRbawZEn3Wk5DGS
	4d2jUXzHn1FleAJ54abVjNiQBxPhXPJ12Qoo7/30/3ETbormk9mq7gkGBl/GFd4qvJ6IrycT3+u
	4cFL2P8tsgaiYTt8+ZCQxD2C9s29y1Mtzmvf8OLJOILShruxyg/MqoqUK7Rd7pe7bH0N2hwTGZk
	hzOgsIwotBCRlpruskKGm8F+UIn8wFftjaHSz3eKx2WtwkJz8GK6bZMPJgMLz5UN
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr26455364c88.26.1793822016817;
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm9239684c88.11.2026.11.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Wed,  4 Nov 2026 14:53:17 -0500
Message-ID: <20261104195317.8284-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101013817.22d67ea7@jic23-hlaptop>
References: <20261101013817.22d67ea7@jic23-hlaptop>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> If this isn't matching some legacy interface, then we need more
> on what these do.  Maybe they are suited to some other kernel
> interface? In particular they might need the various controls
> on how destructive they are that something like fwctl brings.
> 
> Generally an arbitrary opaque path to firmware isn't a good idea...
> 
> Jonathan

Here its required, if we write CPU/GPU Pstates and PPT to
some keys (MSTS MSPC HE0N), we can reduce the temp by 10C
And We can fix the dreaded PROCHOT signals on macs, Giving
Same temps as macOS.

But you and Sasha are right, that exposing all keys is a
bad idea, so i have restricted writing to some keys only.
