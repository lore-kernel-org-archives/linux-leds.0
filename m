Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175708;
	b=jMJ8tLLgiIzoNR4y11bQk4/TbDBOPgxYYlA7LlZwvz0K77OCU7dcRAsZhAs/rjmKr0XN
	 hKYKiATv8qhGcmxzzRhdx0vNnSOdZRYJpJb7yS+FyHEBJpDYRmgTs0AKGq1jRKos20ejO
	 4WHd273nkUW6em1z2+QETPViLhBPPSWfrV+P8ISuHhEEXcH+Bp0zAjnqESmUm1HI+ZLIu
	 AYvOWg5Ni47Pc+b1gwpCTBkT3xFo93+4MRCoR+rwyBmIZo3fe90IuWWFH0f40w/h8ceRG
	 znAoa4SJRfj7mTu/l3zI7hgrdQVFlJCAOFQLFWIkHE3nTIrGPq42X18l0fyxILn5PPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175708;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mP+RLv7YA3xoEcSdhiubfekWgYbf7a4Mqt1EnFS2l2E=;
	b=am57wERFL7cWDSwjbp1GoK9yNiF9Yjnsdu1B2pzLy7eElX7bg2KSQYYQ6SY9YjdumD8R
	 xF63XM7Duj4zoNXMty+BKIMj/LFsO5v6YH5xewBYz60WzJ4agancA0baMjdSFT5UDrHu2
	 YiBlqVS3TrMnaZZYNrkdctPja6kNus0f02pViRVdUFaTj5iXLusVYZCSem2jmgq5JUJjh
	 sbMBtbF3XRyYoiKAvftdcaIZpYAxdvZdVDsG047xNgak2R9pLISy0osEsG1kX4b/LUFwR
	 xMsQRaUAS08xug44Cuh88GqrSFS6rlTe1WnbFEn5SFBAu+m5mRMhyF4S1dvZ9AptyFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=I59MaAEe;
	arc=none smtp.remote-ip=91.218.175.229
Received: from mta0.migadu.com (out-229.mta0.migadu.com [91.218.175.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500D6606A330
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 22:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500D6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=I59MaAEe
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E9GlFD/nkAV+QrkBwclW4eEowvk8rBIRknJho/hf9L8=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794175700; v=1; x=1794780500;
 b=I59MaAEeCdaKCfMuUTHPbIyVzbfz3Pm73y6uowmDLnatoZBgMnAoNKXERlrLKeNuoF6PAiaa
 gOWLTe5to8441RYieziKGyelF0YQZom3ZvDGCv+pkIdn8Nb15XvmMENYaWnWYTyesATF97ejHwH
 iXXLkBh/ErBvRteDdtryUUWVITO3GowgFIKGpEN7DtgdW10I5ZeY8+HwDFt3cV5vX4ol2kZ8iZ/
 /4gCPoSX3mKUghd2jKKcwZgViMqDFf37cg3amH63iwaTbP0/XL9EElS6bbVqrFuJTvhHkxDhzQW
 WSCvT1EVtMvY1Mm7Ur/iqO2PvZQ10BO741gMI0kbQTgXA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b8502a391023e8f;
	Sun, 08 Nov 2026 22:08:20 +0000
X-Mizu-Trace-ID: 7b8502a391023e8f
X-Migadu-Flow: FLOW_OUT
Message-ID: <ea9edcdb-cecb-4fe8-97d5-1dead1ea8fd1@postmarketos.org>
Date: Sun, 8 Nov 2026 15:08:16 -0700
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
Subject: Re: [PATCH v4 0/4] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>,
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
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
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 2:49 p.m., Paul Sajna wrote:
> I'll do my best to address all of Sashiko's comments, but it might take
> me some time to circle back, don't bother reviewing until I've done
> this.

Hello Lee, I believe I have addressed all the robot's comments, and this 
is now ready for a proper review.

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
