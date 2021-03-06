/*
* Copyright (c) 2009 Johns Hopkins University.
* All rights reserved.
*
* Permission to use, copy, modify, and distribute this software and its
* documentation for any purpose, without fee, and without written
* agreement is hereby granted, provided that the above copyright
* notice, the (updated) modification history and the author appear in
* all copies of this source code.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS  `AS IS'
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED  TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR  PURPOSE
* ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR  CONTRIBUTORS
* BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, LOSS OF USE,  DATA,
* OR PROFITS) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
* CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR  OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
* THE POSSIBILITY OF SUCH DAMAGE.
*/

/**
 * ADC configuration settings (part of test application) for SAM3U's 12 bit ADC
 * @author JeongGil Ko
 */


#include "sam3uadc12bhardware.h"

module AdcReaderP
{
  provides interface AdcConfigure<const sam3u_adc12_channel_config_t*>;
}

implementation {
  const sam3u_adc12_channel_config_t config = {
  channel: 0,
  diff: 0,
  prescal: 2,
  lowres: 0,
  shtim: 15,
  ibctl: 1,
  sleep: 0,
  startup: 104,
  trgen: 0,
  trgsel: 0
  };

  async command const sam3u_adc12_channel_config_t* AdcConfigure.getConfiguration() {
    return &config;
  }
}
