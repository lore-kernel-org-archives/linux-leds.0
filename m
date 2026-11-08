Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174675;
	b=MxSkwIAxX4wk38KmXumdtNXh+B4hKVX9UqK8oiZTHsoTbVseRCFVVAyBrV0VVFHRowBA
	 y3hIat0OWVZM4cWxclXK71MwM69e9QUsMXUAmVNa3PWrkI99z690XW2VvqFflIdDv5eth
	 Pff0jV889uy6AqRBTBs250zSXg0t162qu22pCso/226Ic45ByXm1NIjr+ljP937vPILYt
	 sIDisTj2UjxhQHrISCGzi8Jrkp3wCQqhcrkHIt/oKxb9FUcvDbonxRHIKJ9EmlL5RQiKH
	 c/oYqjW505vfNuDyQ96jdRrlQBqf3q7riZ5V4ZTLqyHn8pQDVMYkA6pj1MtJwn57c4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kpUONmbT7hWv2Y7CdQy5xxfROFTeKUAU2jyoeqsZvoo=;
	b=ERposMJZjE3L3cnIfHu+sKVGoY1lKC4SH+sRW/crgRdk76pNArSEjz6krE8dthG/Qmx8
	 2HhfhF4qCHI7hjhNrWPJmTwyyF6rIZEnVEDqYp057gPZ4BjK2I9GsFNZspTCpBvO1WfYq
	 UNsGW0MXGEzApjOxZ8Zq7vcUC45dk7/xnyeOzFx8l/WHIlDTJN1A4AUDTdL2hKCbYXCc7
	 47UdAx5oi3IfLHcIfu5hq+MqSFjEqCbt3kUMudDRCJhrbcY1WsxufwWhPG1egdkL03Tn9
	 B2HcolPrg9lk6hyjRz1GOhCZ0nIuUxj5+tTpqcX2MSqtnkMI8OgQe4GQq7yDnrtJu+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=rhS9qumP;
	arc=none smtp.remote-ip=91.218.175.153
Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461D606A31C
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E461D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=rhS9qumP
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zn5fPGHHigpvJLucCOlqEpjKvVEKZ9N35Myfk0UnTS4=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174673; v=1; x=1794779473;
 b=rhS9qumPmAGrvfxmodyYdbUMW6q8h/Jgz3LA+O6NOoGWfHCWW5/dtSjtMisFwWTIjYKb7Y8d
 nnqNuG/Y0XB7OP5rfd0+GLHJ47RMOxS3uuGWjpEPsgXvc7LAKrFAji4/NLa2EEf7BLBoqgvTPAN
 zJoFeKtzdf9SgQQgkXMQRsDkdRkI2NCPA7lONapwYdHmbz5XblqDNIsSrZaTyKL9wxBGlRz37cO
 0BeL8nuAFlh1x+ZBmsThWnuGNzNoE1XHovVkYpNt/AS5NRN4wpap8jC3J6wkY7Zq4pYy6rL5bYQ
 VTQ1DtocTdr3PVOmpjJZr5oizyypR6LAq7VRNUQslf5Fw==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb03e027439b5384;
	Sun, 08 Nov 2026 21:51:12 +0000
X-Mizu-Trace-ID: cb03e027439b5384
X-Migadu-Flow: FLOW_OUT
Message-ID: <6f59d8b7-a4d4-4cf6-a6e8-0cd1542c44e1@postmarketos.org>
Date: Sun, 8 Nov 2026 14:51:09 -0700
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>,
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 2:49 p.m., Paul Sajna wrote:
> +#define AW2016_23_27_33_CHIPID 0x09 /* vendor shared same chipid between several chips */

I'm not sure if I should add compatibles for all of these variants.
I would only be able to test 2027, but they should in theory all be 
software compatible if they have the same chipid.

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
